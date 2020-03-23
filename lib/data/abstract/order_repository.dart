import 'package:openflutterecommerce/config/theme.dart';

import 'model/user_order.dart';

abstract class OrderRepository {
  ///returns orders which were made by this user or with this device
  ///(depending on concrete realization). It divides the result to chunks with
  ///pagination settings: [pageIndex] and [pageSize]
  Future<List<UserOrder>> getMyOrders(
      {int pageIndex = 0, int pageSize = AppConsts.PAGE_SIZE});

  ///returns order details for order with [orderId]
  Future<UserOrder> getOrderDetails(int orderId);

  ///adds new order
  Future placeNewOrder(UserOrder order);

  /// it is used to update order status by backend (in case delivery status
  /// changed or any items are out of stock or something similar). [order.id]
  /// should remain the same as in the original order
  Future updateOrder(UserOrder order);
}
