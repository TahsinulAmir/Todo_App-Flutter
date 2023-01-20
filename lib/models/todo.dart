class Todo {
  final String id;
  final String title;
  final String desc;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.desc,
      this.isCompleted = false});
}
