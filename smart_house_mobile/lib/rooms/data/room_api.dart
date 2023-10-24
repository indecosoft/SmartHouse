import 'package:Homey/core/error_wrapper.dart';
import 'package:Homey/core/network.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/domain/room_type.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'room_api.g.dart';

@riverpod
RoomApi roomApi(RoomApiRef ref) => RoomApi(ref.watch(dioProvider));

class RoomApi {
  final Dio _dio;

  const RoomApi(this._dio);

  Future<List<RoomType>> getRoomTypes() async {
    return apiWrapper<List<RoomType>, List<dynamic>>(
      callable: () => _dio.get('/api/get/roomTypes'),
      responseMapper: (response) =>
          response.map((type) => RoomType.fromJson(type)).toList(),
    );
  }

  Future<Room> createRoom(
      final int houseId, final String roomName, final int typeId) async {
    return apiWrapper<Room, Map<String, dynamic>>(
        callable: () => _dio.post('/api/add/room', data: {
              'houseId': houseId,
              'roomName': roomName,
              'typeId': typeId,
            }),
        responseMapper: Room.fromJson);
  }

  Future<bool> deleteRoom(final int roomId) async {
    return apiWrapper<bool, Map<String, dynamic>>(
        callable: () => _dio.post('/api/remove/room', data: {
              'roomId': roomId,
            }),
        responseMapper: (_) => true);
  }
}
