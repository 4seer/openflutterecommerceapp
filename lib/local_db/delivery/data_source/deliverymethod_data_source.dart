import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/delivery/entity/deliverymethod_entity.dart';

class DeliveryMethodDataSource extends DataSource {
  @override
  Future<List<DeliveryMethodEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return DeliveryMethodEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
      );
    });
  }

  @override
  Future<DeliveryMethodEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return DeliveryMethodEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      price: maps[0]['price'],
    );
  }

  @override
  String get tableName => 'DeliveryMethod';

  @override
  String get primaryKey => 'id';
}
