import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/cart/product_cart_entity.dart';

class ProductCartDataSource extends DataSource {
  @override
  Future<List<ProductCartEntity>> all() async {
    checkDatabaseConnection();

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
    checkDatabaseConnection();

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
