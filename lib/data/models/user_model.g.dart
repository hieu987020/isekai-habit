// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['user_id'] as String,
      name: json['user_name'] as String,
      habits:
          (json['habits'] as List<dynamic>?)
              ?.map((e) => HabitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'user_name': instance.name,
      'habits': instance.habits,
    };
