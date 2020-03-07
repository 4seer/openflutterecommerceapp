import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_review_entity.dart';

class ProductReviewDataSource extends DataSource {
  @override
  Future<List<ProductReviewEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductReviewEntity(
        id: maps[i]['id'],
        description: maps[i]['description'],
        productId: maps[i]['productId'],
        rating: maps[i]['rating'],
        hasPhoto: (maps[i]['hasPhoto']).toString() == '1',
        date: maps[i]['date'],
        author: maps[i]['author'],
        thumb: maps[i]['thumb'],
      );
    });
  }

  @override
  Future<ProductReviewEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductReviewEntity(
      id: maps[0]['id'],
      description: maps[0]['description'],
      productId: maps[0]['productId'],
      rating: maps[0]['rating'],
      hasPhoto: (maps[0]['hasPhoto']).toString() == '1',
      date: maps[0]['date'],
      author: maps[0]['author'],
      thumb: maps[0]['thumb'],
    );
  }

  @override
  String get tableName => 'ProductReview';

  @override
  String get primaryKey => 'id';
}
