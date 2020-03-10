import 'package:openflutterecommerce/local_db/data_source.dart';
import 'package:openflutterecommerce/local_db/features/order/entities/user_order_entity.dart';

class UserOrderDataSource extends DataSource {
  @override
  Future<List<UserOrderEntity>> all() async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return UserOrderEntity(
        id: maps[i]['id'],
        orderNumber: maps[i]['orderNumber'],
        trackingNumber: maps[i]['trackingNumber'],
        productCount: maps[i]['productCount'],
        promoCodeId: maps[i]['promoCodeId'],
        discountPercent: maps[i]['discountPercent'],
        discountTitle: maps[i]['discountTitle'],
        shippingAddressId: maps[i]['shippingAddressId'],
        orderStatus: maps[i]['orderStatus'],
        totalAmount: maps[i]['totalAmount'],
        deliveryMethodId: maps[i]['deliveryMethodId'],
        deliveryPrice: maps[i]['deliveryPrice'],
      );
    });
  }

  @override
  Future<UserOrderEntity> get(int id) async {
    checkDatabaseConnection();

    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$primaryKey = ?', whereArgs: [id]);

    return UserOrderEntity(
      id: maps[0]['id'],
      orderNumber: maps[0]['orderNumber'],
      trackingNumber: maps[0]['trackingNumber'],
      productCount: maps[0]['productCount'],
      promoCodeId: maps[0]['promoCodeId'],
      discountPercent: maps[0]['discountPercent'],
      discountTitle: maps[0]['discountTitle'],
      shippingAddressId: maps[0]['shippingAddressId'],
      orderStatus: maps[0]['orderStatus'],
      totalAmount: maps[0]['totalAmount'],
      deliveryMethodId: maps[0]['deliveryMethodId'],
      deliveryPrice: maps[0]['deliveryPrice'],
    );
  }

  @override
  String get tableName => 'UserOrder';

  @override
  String get primaryKey => 'id';
}
