import 'package:json_annotation/json_annotation.dart';
import 'package:isekai_habit/domain/entities/habit_entity.dart';

part 'habit_model.g.dart';

@JsonSerializable()
class HabitModel {
  @JsonKey(name: 'habit_id') // ✅ Maps 'habit_id' from API to 'id'
  final String id;

  @JsonKey(name: 'habit_name') // ✅ Maps 'habit_name' from API to 'name'
  final String name;

  final Map<String, bool> timeline; // ✅ JSON stores keys as Strings

  HabitModel({required this.id, required this.name, required this.timeline});

  /// ✅ JSON Serialization
  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);

  Map<String, dynamic> toJson() => _$HabitModelToJson(this);

  /// ✅ CopyWith Method
  HabitModel copyWith({String? id, String? name, Map<String, bool>? timeline}) {
    return HabitModel(
      id: id ?? this.id,
      name: name ?? this.name,
      timeline: timeline ?? this.timeline,
    );
  }

  /// ✅ Convert to Entity
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
