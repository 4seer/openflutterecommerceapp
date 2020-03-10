import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/user/user_entity.dart';

class UserDataSource extends DataSource {
  @override
  Future<List<UserEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return UserEntity(
        id: maps[i]['id'],
        name: maps[i]['name'],
        avatar: maps[i]['avatar'],
        email: maps[i]['email'],
        password: maps[i]['password'],
        birthDate: maps[i]['birthDate'],
        salesNotification: maps[i]['salesNotification'].toString() == '1',
        newArrivalsNotification:
            maps[i]['newArrivalsNotification'].toString() == '1',
        deliveryStatusChanges:
            maps[i]['deliveryStatusChanges'].toString() == '1',
      );
    });
  }

  @override
  Future<UserEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return UserEntity(
      id: maps[0]['id'],
      name: maps[0]['name'],
      avatar: maps[0]['avatar'],
      email: maps[0]['email'],
      password: maps[0]['password'],
      birthDate: maps[0]['birthDate'],
      salesNotification: maps[0]['salesNotification'].toString() == '1',
      newArrivalsNotification:
          maps[0]['newArrivalsNotification'].toString() == '1',
      deliveryStatusChanges: maps[0]['deliveryStatusChanges'].toString() == '1',
    );
  }

  @override
  String get tableName => 'User';

  @override
  String get primaryKey => 'id';
}
