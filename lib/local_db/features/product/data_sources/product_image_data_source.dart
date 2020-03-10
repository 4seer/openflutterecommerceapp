import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_image_entity.dart';

class ProductImageDataSource extends DataSource {
  @override
  Future<List<ProductImageEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductImageEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        thumb: maps[i]['thumb'],
        image: maps[i]['image'],
      );
    });
  }

  @override
  Future<ProductImageEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductImageEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      thumb: maps[0]['thumb'],
      image: maps[0]['image'],
    );
  }

  @override
  String get tableName => 'ProductImage';

  @override
  String get primaryKey => 'id';
}
