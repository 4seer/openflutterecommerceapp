import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/hashtag/category_hashtag_entity.dart';

class CategoryHashTagDataSource extends DataSource {
  @override
  Future<List<CategoryHashTagEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return CategoryHashTagEntity(
        id: maps[i]['id'],
        hashTagId: maps[i]['hashTagId'],
        categoryId: maps[i]['categoryId'],
      );
    });
  }

  @override
  Future<CategoryHashTagEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return CategoryHashTagEntity(
      id: maps[0]['id'],
      hashTagId: maps[0]['hashTagId'],
      categoryId: maps[0]['categoryId'],
    );
  }

  @override
  String get tableName => 'CategoryHashTag';

  @override
  String get primaryKey => 'id';
}
