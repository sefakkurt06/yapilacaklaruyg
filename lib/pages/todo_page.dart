import 'package:flutter/material.dart';
import 'package:yapilacaklar/data/todo_service.dart';
import 'package:yapilacaklar/models/todo.dart';

import '../hakkinda.dart';

// ignore: must_be_immutable
class TodoPage extends StatelessWidget {
  TodoService todoService =  TodoService.instance;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final titleField = TextFormField(
      controller: titleController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
      ),
    );
    final descriptionField = TextFormField(
      controller: descController,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
      ),
    );

    // ignore: deprecated_member_use
    final saveButton = FlatButton(
      onPressed: (){
        todoService.addTodo(Todo(
          id: null,
          title: titleController.text,
          description: descController.text,
          isDone: false,))
            .then((value) => Navigator.pop(context));
      },
      child: Text("Kaydet",style: TextStyle(color: Colors.white),),
      color: Colors.blue,
    );

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Yeni Görev Ekle"),
      ),
      body: Column(
        children: [
          Padding(
      padding: const EdgeInsets.symmetric(vertical:16.0),
      child: ElevatedButton(
        onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => hakkinda()),);
      },
        child: Text('Hakkında'),),
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleField,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: descriptionField,
          ),
          saveButton,
        ],
      ),
    );
  }
}
