class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  // convert from false to true or true to false
  void doneChange() {
    isDone = !isDone;
  }
}
