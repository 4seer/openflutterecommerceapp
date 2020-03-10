import 'package:openflutterecommerce/data/local/data_source.dart';
import 'package:openflutterecommerce/domain/entities/order/order_product_parameter_entity.dart';

class OrderProductParameterDataSource extends DataSource {
  @override
  Future<List<OrderProductParameterEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return OrderProductParameterEntity(
        id: maps[i]['id'],
        productId: maps[i]['productId'],
        parameterId: maps[i]['parameterId'],
        parameterValueId: maps[i]['parameterValueId'],
      );
    });
  }

  @override
  Future<OrderProductParameterEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return OrderProductParameterEntity(
      id: maps[0]['id'],
      productId: maps[0]['productId'],
      parameterId: maps[0]['parameterId'],
      parameterValueId: maps[0]['parameterValueId'],
    );
  }

  @override
  String get tableName => 'OrderProductParameter';

  @override
  String get primaryKey => 'id';
}
