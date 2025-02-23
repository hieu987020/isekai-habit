class HabitEntity {
  final String id;
  final String name;
  final Map<DateTime, bool> timeline;

  const HabitEntity({
    required this.id,
    required this.name,
    required this.timeline,
  });

  /// ✅ Manually implemented `copyWith`
  HabitEntity copyWith({
    String? id,
    String? name,
    bool? completed,
    Map<DateTime, bool>? timeline,
  }) {
    return HabitEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      timeline: timeline ?? this.timeline,
    );
  }
}