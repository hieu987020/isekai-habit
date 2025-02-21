class Habit {
  final String id;
  final String name;
  final Map<DateTime, bool> timeline;

  Habit({
    required this.id,
    required this.name,
    required this.timeline,
  });
}