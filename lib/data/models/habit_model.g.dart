// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitModelImpl _$$HabitModelImplFromJson(Map<String, dynamic> json) =>
    _$HabitModelImpl(
      id: json['habit_id'] as String,
      name: json['habit_name'] as String,
      timeline: Map<String, bool>.from(json['timeline'] as Map),
    );

Map<String, dynamic> _$$HabitModelImplToJson(_$HabitModelImpl instance) =>
    <String, dynamic>{
      'habit_id': instance.id,
      'habit_name': instance.name,
      'timeline': instance.timeline,
    };
