class Todo {
  Todo({this.title,this.isDone=false,this.note,this.todoTime,this.category});
  String title;
  bool isDone;
  String note;
  DateTime todoTime;
  String category;
  set changeTitle (String newTitle){
    title = newTitle;
  }
  set toggleIsDone (bool isChecked){
    isDone = isChecked;
  }
  set changeNote (newNote){
    note = newNote;
  }
  set changeTime (newTime){
    todoTime = newTime;
  }
}