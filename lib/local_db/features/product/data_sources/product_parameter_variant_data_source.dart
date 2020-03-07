import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_parameter_variant_entity.dart';

class ProductParameterVariantDataSource extends DataSource {
  @override
  Future<List<ProductParameterVariantEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductParameterVariantEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        productParameterId: maps[i]['productParameterId'],
        additionalPrice: maps[i]['additionalPrice'],
      );
    });
  }

  @override
  Future<ProductParameterVariantEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductParameterVariantEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      productParameterId: maps[0]['productParameterId'],
      additionalPrice: maps[0]['additionalPrice'],
    );
  }

  @override
  String get tableName => 'ProductParameterVariant';

  @override
  String get primaryKey => 'id';
}
