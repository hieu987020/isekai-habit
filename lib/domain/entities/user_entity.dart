import 'package:isekai_habit/domain/entities/habit_entity.dart';

class UserEntity {
  final String id;
  final String name;
  final List<HabitEntity> habits;

  const UserEntity({
    required this.id,
    required this.name,
    required this.habits,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    List<HabitEntity>? habits,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      habits: habits ?? this.habits,
    );
  }
}