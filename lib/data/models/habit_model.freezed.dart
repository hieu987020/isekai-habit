// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) {
  return _HabitModel.fromJson(json);
}

/// @nodoc
mixin _$HabitModel {
  @JsonKey(name: 'habit_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'habit_name')
  String get name => throw _privateConstructorUsedError;
  Map<String, bool> get timeline => throw _privateConstructorUsedError;

  /// Serializes this HabitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitModelCopyWith<HabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitModelCopyWith<$Res> {
  factory $HabitModelCopyWith(
    HabitModel value,
    $Res Function(HabitModel) then,
  ) = _$HabitModelCopyWithImpl<$Res, HabitModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'habit_id') String id,
    @JsonKey(name: 'habit_name') String name,
    Map<String, bool> timeline,
  });
}

/// @nodoc
class _$HabitModelCopyWithImpl<$Res, $Val extends HabitModel>
    implements $HabitModelCopyWith<$Res> {
  _$HabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? timeline = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            timeline:
                null == timeline
                    ? _value.timeline
                    : timeline // ignore: cast_nullable_to_non_nullable
                        as Map<String, bool>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HabitModelImplCopyWith<$Res>
    implements $HabitModelCopyWith<$Res> {
  factory _$$HabitModelImplCopyWith(
    _$HabitModelImpl value,
    $Res Function(_$HabitModelImpl) then,
  ) = __$$HabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'habit_id') String id,
    @JsonKey(name: 'habit_name') String name,
    Map<String, bool> timeline,
  });
}

/// @nodoc
class __$$HabitModelImplCopyWithImpl<$Res>
    extends _$HabitModelCopyWithImpl<$Res, _$HabitModelImpl>
    implements _$$HabitModelImplCopyWith<$Res> {
  __$$HabitModelImplCopyWithImpl(
    _$HabitModelImpl _value,
    $Res Function(_$HabitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? timeline = null}) {
    return _then(
      _$HabitModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        timeline:
            null == timeline
                ? _value._timeline
                : timeline // ignore: cast_nullable_to_non_nullable
                    as Map<String, bool>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitModelImpl implements _HabitModel {
  const _$HabitModelImpl({
    @JsonKey(name: 'habit_id') required this.id,
    @JsonKey(name: 'habit_name') required this.name,
    required final Map<String, bool> timeline,
  }) : _timeline = timeline;

  factory _$HabitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitModelImplFromJson(json);

  @override
  @JsonKey(name: 'habit_id')
  final String id;
  @override
  @JsonKey(name: 'habit_name')
  final String name;
  final Map<String, bool> _timeline;
  @override
  Map<String, bool> get timeline {
    if (_timeline is EqualUnmodifiableMapView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_timeline);
  }

  @override
  String toString() {
    return 'HabitModel(id: $id, name: $name, timeline: $timeline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_timeline),
  );

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      __$$HabitModelImplCopyWithImpl<_$HabitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitModelImplToJson(this);
  }
}

abstract class _HabitModel implements HabitModel {
  const factory _HabitModel({
    @JsonKey(name: 'habit_id') required final String id,
    @JsonKey(name: 'habit_name') required final String name,
    required final Map<String, bool> timeline,
  }) = _$HabitModelImpl;

  factory _HabitModel.fromJson(Map<String, dynamic> json) =
      _$HabitModelImpl.fromJson;

  @override
  @JsonKey(name: 'habit_id')
  String get id;
  @override
  @JsonKey(name: 'habit_name')
  String get name;
  @override
  Map<String, bool> get timeline;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
