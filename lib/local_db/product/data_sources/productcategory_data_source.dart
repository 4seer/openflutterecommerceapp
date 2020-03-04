import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/product/entities/productcategory_entity.dart';

class ProductCategoryDataSource extends DataSource {
  @override
  Future<List<ProductCategoryEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductCategoryEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        image: maps[i]['image'],
        thumb: maps[i]['thumb'],
        parentId: maps[i]['parentId'],
      );
    });
  }

  @override
  Future<ProductCategoryEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductCategoryEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      description: maps[0]['description'],
      image: maps[0]['image'],
      thumb: maps[0]['thumb'],
      parentId: maps[0]['parentId'],
    );
  }

  @override
  String get tableName => 'ProductCategory';

  @override
  String get primaryKey => 'id';
}
