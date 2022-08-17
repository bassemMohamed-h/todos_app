class TodoModel{
  String taskName;
  String taskDescription;
  DateTime stratDate;
  DateTime endDate;
  bool checkDone = false;

  TodoModel(
      {
        required this.taskName,
        required this.taskDescription,
        required this.stratDate,
        required this.endDate,
        this.checkDone = false}
      );
}