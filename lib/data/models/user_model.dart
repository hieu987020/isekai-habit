import 'package:isekai_habit/data/models/habit_model.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: 'user_id') required String id,
    @JsonKey(name: 'user_name') required String name,
    @Default([]) List<HabitModel> habits,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        habits: habits.map((habit) => habit.toEntity()).toList(),
      );
}
