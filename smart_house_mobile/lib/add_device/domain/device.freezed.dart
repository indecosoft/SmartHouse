// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  @Id()
  int get id => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get houseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String? get ip => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  int get readingFrequency => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {@Id() int id,
      int? roomId,
      int? houseId,
      String name,
      bool isOnline,
      String macAddress,
      String? ip,
      String data,
      int readingFrequency,
      DeviceType type});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = freezed,
    Object? houseId = freezed,
    Object? name = null,
    Object? isOnline = null,
    Object? macAddress = null,
    Object? ip = freezed,
    Object? data = null,
    Object? readingFrequency = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      houseId: freezed == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      readingFrequency: null == readingFrequency
          ? _value.readingFrequency
          : readingFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$_DeviceCopyWith(_$_Device value, $Res Function(_$_Device) then) =
      __$$_DeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id() int id,
      int? roomId,
      int? houseId,
      String name,
      bool isOnline,
      String macAddress,
      String? ip,
      String data,
      int readingFrequency,
      DeviceType type});
}

/// @nodoc
class __$$_DeviceCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$_Device>
    implements _$$_DeviceCopyWith<$Res> {
  __$$_DeviceCopyWithImpl(_$_Device _value, $Res Function(_$_Device) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = freezed,
    Object? houseId = freezed,
    Object? name = null,
    Object? isOnline = null,
    Object? macAddress = null,
    Object? ip = freezed,
    Object? data = null,
    Object? readingFrequency = null,
    Object? type = null,
  }) {
    return _then(_$_Device(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      houseId: freezed == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      readingFrequency: null == readingFrequency
          ? _value.readingFrequency
          : readingFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Device implements _Device {
  const _$_Device(
      {@Id() required this.id,
      this.roomId,
      this.houseId,
      required this.name,
      this.isOnline = false,
      required this.macAddress,
      this.ip,
      this.data = '{}',
      this.readingFrequency = 10,
      this.type = DeviceType.unknown});

  factory _$_Device.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceFromJson(json);

  @override
  @Id()
  final int id;
  @override
  final int? roomId;
  @override
  final int? houseId;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  final String macAddress;
  @override
  final String? ip;
  @override
  @JsonKey()
  final String data;
  @override
  @JsonKey()
  final int readingFrequency;
  @override
  @JsonKey()
  final DeviceType type;

  @override
  String toString() {
    return 'Device(id: $id, roomId: $roomId, houseId: $houseId, name: $name, isOnline: $isOnline, macAddress: $macAddress, ip: $ip, data: $data, readingFrequency: $readingFrequency, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Device &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.readingFrequency, readingFrequency) ||
                other.readingFrequency == readingFrequency) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, roomId, houseId, name,
      isOnline, macAddress, ip, data, readingFrequency, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      __$$_DeviceCopyWithImpl<_$_Device>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {@Id() required final int id,
      final int? roomId,
      final int? houseId,
      required final String name,
      final bool isOnline,
      required final String macAddress,
      final String? ip,
      final String data,
      final int readingFrequency,
      final DeviceType type}) = _$_Device;

  factory _Device.fromJson(Map<String, dynamic> json) = _$_Device.fromJson;

  @override
  @Id()
  int get id;
  @override
  int? get roomId;
  @override
  int? get houseId;
  @override
  String get name;
  @override
  bool get isOnline;
  @override
  String get macAddress;
  @override
  String? get ip;
  @override
  String get data;
  @override
  int get readingFrequency;
  @override
  DeviceType get type;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      throw _privateConstructorUsedError;
}
