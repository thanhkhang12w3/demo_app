class Task {
  final String title;
  final String description;
  bool isImportant;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isImportant = false,
    this.isCompleted = false,
  });
}
