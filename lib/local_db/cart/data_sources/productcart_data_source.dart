import 'package:openflutterecommerce/local_db/cart/entity/productcart_entity.dart';
import 'package:openflutterecommerce/local_db/data_source.dart';

class ProductCartDataSource extends DataSource {
  @override
  Future<List<ProductCartEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductCartEntity(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        productCount: maps[i]['productCount'],
        totalPrice: maps[i]['totalPrice'],
      );
    });
  }

  @override
  Future<ProductCartEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductCartEntity(
      id: maps[0]['id'],
      productId: maps[0]['productId'],
      productCount: maps[0]['productCount'],
      totalPrice: maps[0]['totalPrice'],
    );
  }

  @override
  String get tableName => 'ProductCart';

  @override
  String get primaryKey => 'id';
}
