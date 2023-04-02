class Event {
  String name, description;

  bool isCompleted;
  DateTime? from, to;
  Event({
    required this.name,
    this.description = '',
    this.isCompleted = false,
    this.from,
    this.to,
  });
}
