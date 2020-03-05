import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/hashtag/entities/hashtag_entity.dart';

class HashTagDataSource extends DataSource {
  @override
  Future<List<HashTagEntity>> all() async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return HashTagEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  @override
  Future<HashTagEntity> get(int id) async {
    await openDatabaseIfNotOpened();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return HashTagEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
    );
  }

  @override
  String get tableName => 'HashTag';

  @override
  String get primaryKey => 'id';
}
