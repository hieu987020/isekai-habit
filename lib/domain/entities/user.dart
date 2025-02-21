
import 'package:isekai_habit/domain/entities/habit.dart';

class User {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final List<Habit> habits;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.habits,
  });
}