class Todo {
  Todo(
      {this.title,
      this.isDone = false,
      this.note,
      this.todoTime,
      this.category});
  String title;
  bool isDone;
  String note;
  DateTime todoTime;
  String category;
}
