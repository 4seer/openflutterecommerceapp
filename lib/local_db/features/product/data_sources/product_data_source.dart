import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/product/entities/product_entity.dart';

class ProductDataSource extends DataSource {
  @override
  Future<List<ProductEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: maps[i]['image'],
        thumb: maps[i]['thumb'],
        price: maps[i]['price'],
        discountPercent: maps[i]['discountPercent'],
        categoryId: maps[i]['categoryId'],
        amount: maps[i]['amount'],
        description: maps[i]['description'],
        isFavourite: maps[i]['isFavourite'].toString() == '1',
        rating: maps[i]['rating'],
        rating1Count: maps[i]['rating1Count'],
        rating2Count: maps[i]['rating2Count'],
        rating3Count: maps[i]['rating3Count'],
        rating4Count: maps[i]['rating4Count'],
        rating5Count: maps[i]['rating5Count'],
      );
    });
  }

  @override
  Future<ProductEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      image: maps[0]['image'],
      thumb: maps[0]['thumb'],
      price: maps[0]['price'],
      discountPercent: maps[0]['discountPercent'],
      categoryId: maps[0]['categoryId'],
      amount: maps[0]['amount'],
      description: maps[0]['description'],
      isFavourite: maps[0]['isFavourite'].toString() == '1',
      rating: maps[0]['rating'],
      rating1Count: maps[0]['rating1Count'],
      rating2Count: maps[0]['rating2Count'],
      rating3Count: maps[0]['rating3Count'],
      rating4Count: maps[0]['rating4Count'],
      rating5Count: maps[0]['rating5Count'],
    );
  }

  @override
  String get tableName => 'Product';

  @override
  String get primaryKey => 'id';
}
