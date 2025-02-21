import 'package:isekai_habit/domain/entities/habit.dart';

class HabitModel {
  final String id;
  final String name;
  final Map<DateTime, bool> timeline;

  HabitModel({
    required this.id,
    required this.name,
    required this.timeline,
  });

  // Convert HabitModel to Habit entity
  Habit toEntity() {
    return Habit(id: id, name: name, timeline: timeline);
  }

  // Factory to create a HabitModel from a Habit entity
  factory HabitModel.fromEntity(Habit habit) {
    return HabitModel(id: habit.id, name: habit.name, timeline: habit.timeline);
  }
}