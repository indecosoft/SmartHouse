import 'dart:io';

import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/domain/room_type.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

@riverpod
Database database(DatabaseRef ref) => throw UnimplementedError();

@riverpod
Directory applicationDocumentsDirectory(ApplicationDocumentsDirectoryRef ref) =>
    throw UnimplementedError();

@riverpod
Isar isar(IsarRef ref) {
  return Isar.open(
    schemas: [
      DeviceSchema,
      UserSchema,
      HouseSchema,
      RoomTypeSchema,
      RoomSchema,
    ],
    directory: ref.watch(applicationDocumentsDirectoryProvider).path,
  );
}

Future<Database> initDatabase() async {
  final String databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'data.db');
// Make sure the directory exists
  try {
    await Directory(databasesPath).create(recursive: true);
  } catch (_) {}

// open the database
  return await openDatabase(path, version: 1, onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS UserData (id INTEGER PRIMARY KEY, email TEXT, firstName TEXT, lastName TEXT);');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS Houses (id INTEGER PRIMARY KEY, userId INTEGER, dbId INTEGER, name TEXT, address TEXT);');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS Rooms (id INTEGER PRIMARY KEY, houseId INTEGER, dbId INTEGER, name TEXT);');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS Sensors (id INTEGER PRIMARY KEY, roomId INTEGER, dbId INTEGER, name TEXT, sensorType INTEGER, ipAddress TEXT, macAddress TEXT, readingFrequency INTEGER, networkStatus BOOLEAN);');
  });
}

// class SqlHelper {

//   SqlHelper() {
//     log('SqlHelper create');
//   }

//   @protected
//   Database _database;
//   @protected
//   String path;
//   @protected

//   Future<void> initDatabase() async {
//     final String databasesPath = await getDatabasesPath();
//     path = join(databasesPath, 'data.db');
// // Make sure the directory exists
//     try {
//       await Directory(databasesPath).create(recursive: true);
//     } catch (_) {}

// // open the database
//     _database =
//         await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS UserData (id INTEGER PRIMARY KEY, email TEXT, firstName TEXT, lastName TEXT);');
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS Houses (id INTEGER PRIMARY KEY, userId INTEGER, dbId INTEGER, name TEXT, address TEXT);');
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS Rooms (id INTEGER PRIMARY KEY, houseId INTEGER, dbId INTEGER, name TEXT);');
//       await db.execute(
//           'CREATE TABLE IF NOT EXISTS Sensors (id INTEGER PRIMARY KEY, roomId INTEGER, dbId INTEGER, name TEXT, sensorType INTEGER, ipAddress TEXT, macAddress TEXT, readingFrequency INTEGER, networkStatus BOOLEAN);');
//     });
//     log('database', error: _database.isOpen);
//   }

//   Future<void> dropDatabase() async {
//     await deleteDatabase(path);
//     await _database.close();
//   }

//   Future<void> insert(dynamic data) async {
//     if (!_database.isOpen) {
//       log('o sa init');
//       await initDatabase();
//     }
//     await _database.transaction((transaction) async {
//       final int userId = await transaction.rawInsert(
//           'INSERT INTO UserData(email, firstName, lastName) VALUES ("${data['email']}", "${data['firstName']}", "${data['lastName']}");');
//       for (final Map<String, dynamic> house in data['houses']) {
//         final int houseId = await transaction.rawInsert(
//             'INSERT INTO Houses(userId, dbId, name, address) VALUES ($userId, ${house['id']}, "${house['name']}", "${house['address']}");');
//         for (final Map<String, dynamic> room in house['rooms']) {
//           final int roomId = await transaction.rawInsert(
//               'INSERT INTO Rooms(houseId, dbId, name) VALUES ($houseId, ${room['id']}, "${room['name']}");');
//           for (final Map<String, dynamic> sensor in room['sensors']) {
//             await transaction.rawInsert(
//                 'INSERT INTO Sensors(roomId, dbId, name, sensorType, readingFrequency, macAddress, networkStatus) VALUES ($roomId, ${sensor['id']}, "${sensor['name']}", "${sensor['sensorType']}",${sensor['readingFrequency']}, "${sensor['macAddress']}", "${sensor['networkStatus']}");');
//           }
//         }
//       }
//       for (final Map<String, dynamic> device in data['allSensors']) {
//         await transaction.rawInsert(
//             'INSERT INTO Sensors(dbId, name, sensorType, readingFrequency, macAddress, networkStatus) VALUES (${device['id']}, "${device['name']}", "${device['sensorType']}",${device['readingFrequency']}, "${device['macAddress']}", "${device['networkStatus']}");');
//       }
//     }).then((_) async {
//       await AppDataManager().fetchData();
//     }, onError: (e) {
//       log('transaction error', error: e);
//       log(e.toString());
//     });
//   }

//   Future<List<HomeModel>> getAllHouses() async {
//     final List<Map<String, dynamic>> list =
//         await _database.rawQuery('SELECT DISTINCT * FROM Houses ORDER BY dbId');
//     return List<HomeModel>.generate(list.length, (i) {
//       return HomeModel(
//         id: list[i]['id'],
//         dbId: list[i]['dbId'],
//         name: list[i]['name'],
//       );
//     });
//   }

//   Future<List<SensorModel>> getAllSensors() async {
//     final List<Map<String, dynamic>> list = await _database
//         .rawQuery('SELECT DISTINCT * FROM SENSORS ORDER BY dbId');
//     return List<SensorModel>.generate(list.length, (i) {
//       return SensorModel(
//         id: list[i]['id'],
//         dbId: list[i]['dbId'],
//         roomId: list[i]['roomId'],
//         readingFrequency: list[i]['readingFrequency'],
//         ipAddress: list[i]['ipAddress'],
//         macAddress: list[i]['macAddress'],
//         sensorType: list[i]['sensorType'],
//         networkStatus: list[i]['networkStatus'] == 'true',
//         name: list[i]['name'],
//       );
//     });
//   }

//   Future<void> addHome(HomeModel house) async {
//     await _database.rawInsert(
//         'INSERT INTO Houses(userId, dbId, name, address) VALUES (${house.userId}, ${house.dbId}, "${house.name}", "${house.address}");');
//   }

//   Future<void> addRoom(RoomModel room) async {
//     await _database.rawInsert(
//         'INSERT INTO Rooms(houseId, dbId, name) VALUES (${room.houseId}, ${room.dbId}, "${room.name}");');
//   }

//   Future<void> addSensor(SensorModel sensor) async {
//     await _database.rawInsert(
//         'INSERT INTO Sensors(roomId, dbId, name, sensorType, ipAddress, macAddress) VALUES (${sensor.roomId}, ${sensor.dbId}, "${sensor.name}", "${sensor.sensorType}", "${sensor.ipAddress}", "${sensor.macAddress}");');
//   }

//   Future<void> addSensorsToRoom(int roomId, List<SensorModel> devices) async {
//     await _database.transaction((transaction) async {
//       for (final SensorModel device in devices) {
//         log('dev', error: device);
//         await transaction.rawUpdate(
//             'UPDATE Sensors SET roomId = $roomId WHERE macAddress = "${device.macAddress}";');
//       }
//     });
//   }

//   Future<void> updateSensor(SensorModel sensor) async {
//     await _database.rawUpdate(
//         'UPDATE Sensors SET roomId = ${sensor.roomId}, dbId = ${sensor.dbId}, name = "${sensor.name}", sensorType = ${sensor.sensorType}, ipAddress = "${sensor.ipAddress}", networkStatus = "${sensor.networkStatus}", readingFrequency = ${sensor.readingFrequency} WHERE macAddress = "${sensor.macAddress}";');
//   }

//   Future<void> removeDeviceFromRoom(SensorModel sensor) async {
//     await _database.rawUpdate(
//         'UPDATE Sensors SET roomId = NULL WHERE macAddress = "${sensor.macAddress}";');
//   }

//   Future<void> removeRoom(int roomId) async {
//     await _database.transaction((transaction) async {
//       try {
//         await transaction.rawUpdate(
//             'UPDATE Sensors SET roomId = NULL WHERE roomId = $roomId;');
//         await transaction.rawDelete('DELETE FROM Rooms WHERE id = $roomId;');
//       } catch (e) {
//         print(e);
//       }
//     });
//   }

//   Future<void> updateRoom(int roomId, String name) async {
//     await _database.transaction((transaction) async {
//       try {
//         await transaction
//             .rawUpdate('UPDATE Rooms SET name = "$name" WHERE id = $roomId;');
//       } catch (e) {
//         print(e);
//       }
//     });
//   }

//   Future<List<Map<String, dynamic>>> getRoomsByHouseId(int houseId) async {
//     final List<Map<String, dynamic>> list = await _database
//         .rawQuery('SELECT * FROM Rooms WHERE houseId = $houseId');
//     if (list.isEmpty) {
//       return null;
//     }
//     return list;
//   }

//   Future<UserDataModel> getUserData() async {
//     log('getUserData database', error: _database.isOpen);

//     final List<Map<String, dynamic>> list =
//         await _database.rawQuery('SELECT DISTINCT * FROM UserData LIMIT 1');
//     log('list Users', error: list);
//     if (list.isEmpty) {
//       return null;
//     }
//     return UserDataModel(
//       id: list[0]['id'],
//       email: list[0]['email'],
//       firstName: list[0]['firstName'],
//       lastName: list[0]['lastName'],
//     );
//   }

//   Future<HomeModel> getHomeInfoById(int homeId) async {
//     final List<Map<String, dynamic>> list = await _database
//         .rawQuery('SELECT DISTINCT * FROM Houses WHERE id = $homeId');

//     final List<Map<String, dynamic>> rooms = await _database.rawQuery(
//         'SELECT DISTINCT r.* FROM Rooms AS r INNER JOIN Houses AS h ON h.id = r.houseId WHERE h.id = $homeId ORDER BY r.name');
//     final List<Map<String, dynamic>> sensors =
//         await _database.rawQuery('SELECT DISTINCT s.* '
//             'FROM Sensors AS s '
//             'INNER JOIN Rooms AS r ON r.id = s.roomId '
//             'INNER JOIN Houses AS h ON h.id = r.houseId '
//             'WHERE h.id = $homeId '
//             'ORDER BY s.sensorType');
//     log('gggg', error: sensors.toString());
//     if (list.isEmpty) {
//       return null;
//     }
//     final HomeModel home = HomeModel(
//         id: list[0]['id'],
//         dbId: list[0]['dbId'],
//         userId: list[0]['userId'],
//         name: list[0]['name'],
//         address: list[0]['address'],
//         rooms: List<RoomModel>.generate(rooms.length, (i) {
//           final List<dynamic> sortedSensors = sensors
//               .where((sensor) => sensor['roomId'] == rooms[i]['id'])
//               .toList();
//           return RoomModel(
//               id: rooms[i]['id'],
//               houseId: homeId,
//               dbId: rooms[i]['dbId'],
//               name: rooms[i]['name'],
//               sensors: List<SensorModel>.generate(sortedSensors.length, (j) {
//                 return SensorModel(
//                     id: sortedSensors[j]['id'],
//                     dbId: sortedSensors[j]['dbId'],
//                     roomId: sortedSensors[j]['roomId'],
//                     name: sortedSensors[j]['name'],
//                     macAddress: sortedSensors[j]['macAddress'],
//                     networkStatus: sortedSensors[j]['networkStatus'] == 'true',
//                     sensorType: sortedSensors[j]['sensorType']);
//               }));
//         }));
//     log(home.toMap().toString());
//     return home;
//   }

//   Future<void> selectAll() async {
//     final List<Map<String, dynamic>> list =
//         await _database.rawQuery('SELECT DISTINCT * FROM UserData');
//     final List<Map<String, dynamic>> list1 =
//         await _database.rawQuery('SELECT DISTINCT* FROM Houses');
//     final List<Map<String, dynamic>> list2 =
//         await _database.rawQuery('SELECT DISTINCT * FROM Rooms');
//     final List<Map<String, dynamic>> list3 =
//         await _database.rawQuery('SELECT DISTINCT * FROM Sensors');
//     log('selectU', error: list);
//     log('selectH', error: list1);
//     log('selectR', error: list2);
//     log('selectS', error: list3);
//   }
// }
