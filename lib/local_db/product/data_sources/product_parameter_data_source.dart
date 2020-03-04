import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/product/entities/product_parameter_entity.dart';

class ProductParameterDataSource extends DataSource {
  @override
  Future<List<ProductParameterEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductParameterEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  @override
  Future<ProductParameterEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductParameterEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
    );
  }

  @override
  String get tableName => 'ProductParameter';

  @override
  String get primaryKey => 'id';
}
