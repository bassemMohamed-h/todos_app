class TodoModel{
  String taskName;
  String taskDescription;
  DateTime endDate;
  bool checkDone = false;

  TodoModel(
      {
        required this.taskName,
        required this.taskDescription,
        required this.endDate,
        this.checkDone = false}
      );
}