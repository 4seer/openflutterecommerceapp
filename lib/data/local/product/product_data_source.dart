import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/product/product_category_entity.dart';
import 'package:openflutterecommerce/domain/entities/product/product_entity.dart';

class ProductDataSource extends DataSource {
  @override
  Future<List<ProductEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ProductEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        images: [maps[i]['image']],
        thumb: maps[i]['thumb'],
        price: (maps[i]['price'] as num).toDouble(),
        discountPercent: (maps[i]['discountPercent'] as num).toDouble(),
        //TODO: get full list of categories
        categories: [ProductCategoryEntity(id: (maps[i]['categoryId'] as num).toInt(), title: '', description: '', image: '', thumb: '', parentId: null!, orderNumber: null!, count: null!)],
        amount: maps[i]['amount'],
        description: maps[i]['description'],
        isFavourite: maps[i]['isFavourite'].toString() == '1',
        rating: maps[i]['rating'],
        rating1Count: maps[i]['rating1Count'],
        rating2Count: maps[i]['rating2Count'],
        rating3Count: maps[i]['rating3Count'],
        rating4Count: maps[i]['rating4Count'],
        rating5Count: maps[i]['rating5Count'], subTitle: '', hashTags: [], selectableAttributes: [],
      );
    });
  }

  @override
  Future<ProductEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return ProductEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      images: [maps[0]['image']],
      thumb: maps[0]['thumb'],
      price: maps[0]['price'],
      discountPercent: (maps[0]['discountPercent'] as num).toDouble(),
      categories: [ProductCategoryEntity(id: (maps[0]['categoryId'] as num).toInt(), title: '', description: '', image: '', thumb: '', parentId: null!, orderNumber: null!, count: null!)],
      amount: maps[0]['amount'],
      description: maps[0]['description'],
      isFavourite: maps[0]['isFavourite'].toString() == '1',
      rating: maps[0]['rating'],
      rating1Count: maps[0]['rating1Count'],
      rating2Count: maps[0]['rating2Count'],
      rating3Count: maps[0]['rating3Count'],
      rating4Count: maps[0]['rating4Count'],
      rating5Count: maps[0]['rating5Count'], subTitle: '', hashTags: [], selectableAttributes: [],
    );
  }

  @override
  String get tableName => 'Product';

  @override
  String get primaryKey => 'id';
}
