import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/order/entities/order_product_entity.dart';

class OrderProductDataSource extends DataSource {
  @override
  Future<List<OrderProductEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return OrderProductEntity(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        productCount: maps[i]['productCount'],
        totalPrice: maps[i]['totalPrice'],
        title: maps[i]['title'],
        discountPercent: maps[i]['discountPercent'],
        thumb: maps[i]['thumb'],
      );
    });
  }

  @override
  Future<OrderProductEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return OrderProductEntity(
      id: maps[0]['id'],
      productId: maps[0]['productId'],
      productCount: maps[0]['productCount'],
      totalPrice: maps[0]['totalPrice'],
      title: maps[0]['title'],
      discountPercent: maps[0]['discountPercent'],
      thumb: maps[0]['thumb'],
    );
  }

  @override
  String get tableName => 'OrderProduct';

  @override
  String get primaryKey => 'id';
}
