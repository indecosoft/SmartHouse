// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceState _$DeviceStateFromJson(Map<String, dynamic> json) {
  return _DeviceState.fromJson(json);
}

/// @nodoc
mixin _$DeviceState {
  String get name => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  Map<String, dynamic> get state => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res, DeviceState>;
  @useResult
  $Res call(
      {String name,
      bool isOnline,
      Map<String, dynamic> state,
      String timestamp});
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res, $Val extends DeviceState>
    implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOnline = null,
    Object? state = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$_DeviceStateCopyWith(
          _$_DeviceState value, $Res Function(_$_DeviceState) then) =
      __$$_DeviceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool isOnline,
      Map<String, dynamic> state,
      String timestamp});
}

/// @nodoc
class __$$_DeviceStateCopyWithImpl<$Res>
    extends _$DeviceStateCopyWithImpl<$Res, _$_DeviceState>
    implements _$$_DeviceStateCopyWith<$Res> {
  __$$_DeviceStateCopyWithImpl(
      _$_DeviceState _value, $Res Function(_$_DeviceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOnline = null,
    Object? state = null,
    Object? timestamp = null,
  }) {
    return _then(_$_DeviceState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceState implements _DeviceState {
  _$_DeviceState(
      {required this.name,
      this.isOnline = false,
      final Map<String, dynamic> state = const {},
      required this.timestamp})
      : _state = state;

  factory _$_DeviceState.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceStateFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final bool isOnline;
  final Map<String, dynamic> _state;
  @override
  @JsonKey()
  Map<String, dynamic> get state {
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_state);
  }

  @override
  final String timestamp;

  @override
  String toString() {
    return 'DeviceState(name: $name, isOnline: $isOnline, state: $state, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            const DeepCollectionEquality().equals(other._state, _state) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, isOnline,
      const DeepCollectionEquality().hash(_state), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      __$$_DeviceStateCopyWithImpl<_$_DeviceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceStateToJson(
      this,
    );
  }
}

abstract class _DeviceState implements DeviceState {
  factory _DeviceState(
      {required final String name,
      final bool isOnline,
      final Map<String, dynamic> state,
      required final String timestamp}) = _$_DeviceState;

  factory _DeviceState.fromJson(Map<String, dynamic> json) =
      _$_DeviceState.fromJson;

  @override
  String get name;
  @override
  bool get isOnline;
  @override
  Map<String, dynamic> get state;
  @override
  String get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceDetails _$DeviceDetailsFromJson(Map<String, dynamic> json) {
  return _DeviceDetails.fromJson(json);
}

/// @nodoc
mixin _$DeviceDetails {
  String get sensorName => throw _privateConstructorUsedError;
  int get freqMinutes => throw _privateConstructorUsedError;
  DeviceType get sensorType => throw _privateConstructorUsedError;
  String? get server => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceDetailsCopyWith<DeviceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetailsCopyWith<$Res> {
  factory $DeviceDetailsCopyWith(
          DeviceDetails value, $Res Function(DeviceDetails) then) =
      _$DeviceDetailsCopyWithImpl<$Res, DeviceDetails>;
  @useResult
  $Res call(
      {String sensorName,
      int freqMinutes,
      DeviceType sensorType,
      String? server,
      int port,
      String macAddress});
}

/// @nodoc
class _$DeviceDetailsCopyWithImpl<$Res, $Val extends DeviceDetails>
    implements $DeviceDetailsCopyWith<$Res> {
  _$DeviceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensorName = null,
    Object? freqMinutes = null,
    Object? sensorType = null,
    Object? server = freezed,
    Object? port = null,
    Object? macAddress = null,
  }) {
    return _then(_value.copyWith(
      sensorName: null == sensorName
          ? _value.sensorName
          : sensorName // ignore: cast_nullable_to_non_nullable
              as String,
      freqMinutes: null == freqMinutes
          ? _value.freqMinutes
          : freqMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sensorType: null == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceDetailsCopyWith<$Res>
    implements $DeviceDetailsCopyWith<$Res> {
  factory _$$_DeviceDetailsCopyWith(
          _$_DeviceDetails value, $Res Function(_$_DeviceDetails) then) =
      __$$_DeviceDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sensorName,
      int freqMinutes,
      DeviceType sensorType,
      String? server,
      int port,
      String macAddress});
}

/// @nodoc
class __$$_DeviceDetailsCopyWithImpl<$Res>
    extends _$DeviceDetailsCopyWithImpl<$Res, _$_DeviceDetails>
    implements _$$_DeviceDetailsCopyWith<$Res> {
  __$$_DeviceDetailsCopyWithImpl(
      _$_DeviceDetails _value, $Res Function(_$_DeviceDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensorName = null,
    Object? freqMinutes = null,
    Object? sensorType = null,
    Object? server = freezed,
    Object? port = null,
    Object? macAddress = null,
  }) {
    return _then(_$_DeviceDetails(
      sensorName: null == sensorName
          ? _value.sensorName
          : sensorName // ignore: cast_nullable_to_non_nullable
              as String,
      freqMinutes: null == freqMinutes
          ? _value.freqMinutes
          : freqMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      sensorType: null == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String?,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceDetails implements _DeviceDetails {
  _$_DeviceDetails(
      {required this.sensorName,
      required this.freqMinutes,
      this.sensorType = DeviceType.unknown,
      this.server,
      this.port = 1883,
      required this.macAddress});

  factory _$_DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceDetailsFromJson(json);

  @override
  final String sensorName;
  @override
  final int freqMinutes;
  @override
  @JsonKey()
  final DeviceType sensorType;
  @override
  final String? server;
  @override
  @JsonKey()
  final int port;
  @override
  final String macAddress;

  @override
  String toString() {
    return 'DeviceDetails(sensorName: $sensorName, freqMinutes: $freqMinutes, sensorType: $sensorType, server: $server, port: $port, macAddress: $macAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceDetails &&
            (identical(other.sensorName, sensorName) ||
                other.sensorName == sensorName) &&
            (identical(other.freqMinutes, freqMinutes) ||
                other.freqMinutes == freqMinutes) &&
            (identical(other.sensorType, sensorType) ||
                other.sensorType == sensorType) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sensorName, freqMinutes,
      sensorType, server, port, macAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceDetailsCopyWith<_$_DeviceDetails> get copyWith =>
      __$$_DeviceDetailsCopyWithImpl<_$_DeviceDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceDetailsToJson(
      this,
    );
  }
}

abstract class _DeviceDetails implements DeviceDetails {
  factory _DeviceDetails(
      {required final String sensorName,
      required final int freqMinutes,
      final DeviceType sensorType,
      final String? server,
      final int port,
      required final String macAddress}) = _$_DeviceDetails;

  factory _DeviceDetails.fromJson(Map<String, dynamic> json) =
      _$_DeviceDetails.fromJson;

  @override
  String get sensorName;
  @override
  int get freqMinutes;
  @override
  DeviceType get sensorType;
  @override
  String? get server;
  @override
  int get port;
  @override
  String get macAddress;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceDetailsCopyWith<_$_DeviceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
