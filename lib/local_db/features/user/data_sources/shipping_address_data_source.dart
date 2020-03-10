import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/user/entities/shipping_address_entity.dart';

class ShippingAddressDataSource extends DataSource {
  @override
  Future<List<ShippingAddressEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ShippingAddressEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        address: maps[i]['address'],
        city: maps[i]['city'],
        country: maps[i]['country'],
        postal: maps[i]['postal'],
        isDefault: maps[i]['isDefault'].toString() == '1',
      );
    });
  }

  @override
  Future<ShippingAddressEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ShippingAddressEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      address: maps[0]['address'],
      city: maps[0]['city'],
      country: maps[0]['country'],
      postal: maps[0]['postal'],
      isDefault: maps[0]['isDefault'].toString() == '1',
    );
  }

  @override
  String get tableName => 'ShippingAddress';

  @override
  String get primaryKey => 'id';
}
