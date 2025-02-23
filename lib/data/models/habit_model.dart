import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isekai_habit/domain/entities/habit_entity.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
class HabitModel with _$HabitModel {
  const factory HabitModel({
    @JsonKey(name: 'habit_id') required String id,
    @JsonKey(name: 'habit_name') required String name,
    required Map<String, bool> timeline,
  }) = _HabitModel;

  /// ✅ JSON Serialization
  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);
}

/// ✅ Extension to convert `HabitModel` → `HabitEntity`
extension HabitModelX on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      name: name,
      timeline: timeline.map(
        (key, value) => MapEntry(DateTime.parse(key), value),
      ),
    );
  }
}
