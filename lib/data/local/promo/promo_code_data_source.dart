import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/promo/promo_code_entity.dart';

class PromoCodeDataSource extends DataSource {
  @override
  Future<List<PromoCodeEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return PromoCodeEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: maps[i]['image'],
        promoCode: maps[i]['promoCode'],
        discountPercent: maps[i]['discountPercent'],
        belongsToUser: maps[i]['belongsToUser'].toString() == '1',
        wasUsed: maps[i]['wasUsed'].toString() == '1',
      );
    });
  }

  @override
  Future<PromoCodeEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return PromoCodeEntity(
      id: maps[0]['id'],
      title: maps[0]['title'],
      image: maps[0]['image'],
      promoCode: maps[0]['promoCode'],
      discountPercent: maps[0]['discountPercent'],
      belongsToUser: maps[0]['belongsToUser'].toString() == '1',
      wasUsed: maps[0]['wasUsed'].toString() == '1',
    );
  }

  @override
  String get tableName => 'PromoCode';

  @override
  String get primaryKey => 'id';
}
