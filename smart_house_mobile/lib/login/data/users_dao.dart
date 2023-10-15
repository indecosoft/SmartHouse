import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_dao.g.dart';

@riverpod
UsersDao usersDao(UsersDaoRef ref) => UsersDao(isar: ref.watch(isarProvider));

class UsersDao {
  final Isar isar;

  UsersDao({required this.isar});

  Future<void> insertOrReplace(User user) async {
    await isar.write((isar) async {
      isar.users.clear();
      isar.users.put(user);
    });
  }

  /// This method is used to watch the current user
  Stream<User?> watchCurrentUser() async* {
    yield isar.users.where().findFirst();
    yield* isar.users.where().watch(limit: 1).map(
          (e) => e.firstOrNull,
        );
  }
}
