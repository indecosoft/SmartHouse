// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

House _$HouseFromJson(Map<String, dynamic> json) {
  return _House.fromJson(json);
}

/// @nodoc
mixin _$House {
  @Id()
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  List<Room> get rooms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseCopyWith<House> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseCopyWith<$Res> {
  factory $HouseCopyWith(House value, $Res Function(House) then) =
      _$HouseCopyWithImpl<$Res, House>;
  @useResult
  $Res call(
      {@Id() int id,
      String name,
      String address,
      bool isDefault,
      List<Room> rooms});
}

/// @nodoc
class _$HouseCopyWithImpl<$Res, $Val extends House>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? isDefault = null,
    Object? rooms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HouseCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$$_HouseCopyWith(_$_House value, $Res Function(_$_House) then) =
      __$$_HouseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id() int id,
      String name,
      String address,
      bool isDefault,
      List<Room> rooms});
}

/// @nodoc
class __$$_HouseCopyWithImpl<$Res> extends _$HouseCopyWithImpl<$Res, _$_House>
    implements _$$_HouseCopyWith<$Res> {
  __$$_HouseCopyWithImpl(_$_House _value, $Res Function(_$_House) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? isDefault = null,
    Object? rooms = null,
  }) {
    return _then(_$_House(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_House implements _House {
  const _$_House(
      {@Id() required this.id,
      required this.name,
      required this.address,
      this.isDefault = false,
      final List<Room> rooms = const []})
      : _rooms = rooms;

  factory _$_House.fromJson(Map<String, dynamic> json) =>
      _$$_HouseFromJson(json);

  @override
  @Id()
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey()
  final bool isDefault;
  final List<Room> _rooms;
  @override
  @JsonKey()
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'House(id: $id, name: $name, address: $address, isDefault: $isDefault, rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_House &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, isDefault,
      const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HouseCopyWith<_$_House> get copyWith =>
      __$$_HouseCopyWithImpl<_$_House>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HouseToJson(
      this,
    );
  }
}

abstract class _House implements House {
  const factory _House(
      {@Id() required final int id,
      required final String name,
      required final String address,
      final bool isDefault,
      final List<Room> rooms}) = _$_House;

  factory _House.fromJson(Map<String, dynamic> json) = _$_House.fromJson;

  @override
  @Id()
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  bool get isDefault;
  @override
  List<Room> get rooms;
  @override
  @JsonKey(ignore: true)
  _$$_HouseCopyWith<_$_House> get copyWith =>
      throw _privateConstructorUsedError;
}
