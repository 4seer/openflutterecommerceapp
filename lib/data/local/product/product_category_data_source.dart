import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product_category_entity.dart';

class ProductCategoryDataSource extends DataSource {
  @override
  Future<List<ProductCategoryEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductCategoryEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        image: maps[i]['image'],
        thumb: maps[i]['thumb'],
        parentId: maps[i]['parentId'], orderNumber: null!, count: null!,
      );
    });
  }

  @override
  Future<ProductCategoryEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductCategoryEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      description: maps[0]['description'],
      image: maps[0]['image'],
      thumb: maps[0]['thumb'],
      parentId: maps[0]['parentId'], orderNumber: null!, count: null!,
    );
  }

  @override
  String get tableName => 'ProductCategory';

  @override
  String get primaryKey => 'id';
}
