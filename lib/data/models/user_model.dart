import 'package:json_annotation/json_annotation.dart';
import 'package:isekai_habit/data/models/habit_model.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id') // ✅ Maps 'user_id' from API to 'id'
  final String id;

  @JsonKey(name: 'user_name') // ✅ Maps 'user_name' from API to 'name'
  final String name;

  @JsonKey(defaultValue: []) // ✅ Ensures default empty list if missing in API
  final List<HabitModel> habits;

  UserModel({required this.id, required this.name, required this.habits});

  /// ✅ JSON Serialization
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// ✅ CopyWith Method
  UserModel copyWith({String? id, String? name, List<HabitModel>? habits}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      habits: habits ?? this.habits,
    );
  }

  /// ✅ Convert to Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      habits: habits.map((habit) => habit.toEntity()).toList(),
    );
  }
}
