import 'package:isekai_habit/data/models/habit_model.dart';
import 'package:isekai_habit/domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final List<HabitModel> habits;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.habits,
  });

  /// ✅ Convert UserModel -> User (Entity)
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      createdAt: createdAt,
      habits: habits.map((habitModel) => habitModel.toEntity()).toList(),
    );
  }

  /// ✅ Convert User (Entity) -> UserModel
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      createdAt: user.createdAt,
      habits: user.habits.map((habit) => HabitModel.fromEntity(habit)).toList(),
    );
  }
}
