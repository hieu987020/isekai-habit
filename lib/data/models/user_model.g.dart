// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['user_id'] as String,
  name: json['user_name'] as String,
  habits:
      (json['habits'] as List<dynamic>?)
          ?.map((e) => HabitModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'user_id': instance.id,
  'user_name': instance.name,
  'habits': instance.habits,
};
