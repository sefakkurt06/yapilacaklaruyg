import 'package:flutter/material.dart';
import 'package:yapilacaklar/data/todo_service.dart';
import 'package:yapilacaklar/models/todo.dart';
import 'package:yapilacaklar/pages/todo_page.dart';

class TodoListPage extends StatefulWidget {

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoService service = TodoService.instance;
  List<Todo> todos = [];
  List<Todo> doneTodos = [];


  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text("Yapılacaklar"),
        bottom: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.check_box_outline_blank),),
          Tab(
            icon: Icon(Icons.check_box),),
        ],),
      ),
      body: TabBarView(
        children: [
          getTodoList(todos),
          getTodoList(doneTodos),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => TodoPage())).then((value) => loadData());
        },
        child: Icon(Icons.add),),
    );
  }

 Widget getTodoList(List<Todo> todos) {
    return todos.length == 0
       ? Center(child: Text('Yapılacak birsey yok'))
      : ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
           title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: Checkbox(
              onChanged: (value) {
                todos[index].isDone = value;
                service.
                updateisDone(todos[index]).
                then((value) => loadData());
              },
              value: todos[index].isDone,
            ),
          ),
        );
      },
    );
 }


 loadData() {
    
    service.getTodos(true).then((value){
      setState(() {
        todos = value;
      });
    });

    service.getTodos(false).then((value){
      setState(() {
        doneTodos = value;
      });
    });

 }

}