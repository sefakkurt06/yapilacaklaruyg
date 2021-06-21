class Todo {

  int id;
  String title;
  String description;
  bool isDone;

  Todo({this.id,this.isDone,this.description,this.title});

  Map<String,dynamic> toMap() {
    final map = Map<String, dynamic>();
    if(id!=null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['description'] = description;
    map['isDone'] = isDone ? 1 : 0;

    return map;
  }
  factory Todo.fromMap(Map<String,dynamic> map){
    return Todo(
      id: map['id'],
      description: map['description'],
      title: map['title'],
      isDone: map['isDone'] == 1);

  }
}