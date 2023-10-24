// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomType _$RoomTypeFromJson(Map<String, dynamic> json) {
  return _RoomType.fromJson(json);
}

/// @nodoc
mixin _$RoomType {
  @Id()
  int get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomTypeCopyWith<RoomType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomTypeCopyWith<$Res> {
  factory $RoomTypeCopyWith(RoomType value, $Res Function(RoomType) then) =
      _$RoomTypeCopyWithImpl<$Res, RoomType>;
  @useResult
  $Res call({@Id() int id, int type, String name});
}

/// @nodoc
class _$RoomTypeCopyWithImpl<$Res, $Val extends RoomType>
    implements $RoomTypeCopyWith<$Res> {
  _$RoomTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomTypeCopyWith<$Res> implements $RoomTypeCopyWith<$Res> {
  factory _$$_RoomTypeCopyWith(
          _$_RoomType value, $Res Function(_$_RoomType) then) =
      __$$_RoomTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@Id() int id, int type, String name});
}

/// @nodoc
class __$$_RoomTypeCopyWithImpl<$Res>
    extends _$RoomTypeCopyWithImpl<$Res, _$_RoomType>
    implements _$$_RoomTypeCopyWith<$Res> {
  __$$_RoomTypeCopyWithImpl(
      _$_RoomType _value, $Res Function(_$_RoomType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_$_RoomType(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomType implements _RoomType {
  const _$_RoomType(
      {@Id() required this.id, required this.type, required this.name});

  factory _$_RoomType.fromJson(Map<String, dynamic> json) =>
      _$$_RoomTypeFromJson(json);

  @override
  @Id()
  final int id;
  @override
  final int type;
  @override
  final String name;

  @override
  String toString() {
    return 'RoomType(id: $id, type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomTypeCopyWith<_$_RoomType> get copyWith =>
      __$$_RoomTypeCopyWithImpl<_$_RoomType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomTypeToJson(
      this,
    );
  }
}

abstract class _RoomType implements RoomType {
  const factory _RoomType(
      {@Id() required final int id,
      required final int type,
      required final String name}) = _$_RoomType;

  factory _RoomType.fromJson(Map<String, dynamic> json) = _$_RoomType.fromJson;

  @override
  @Id()
  int get id;
  @override
  int get type;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_RoomTypeCopyWith<_$_RoomType> get copyWith =>
      throw _privateConstructorUsedError;
}
