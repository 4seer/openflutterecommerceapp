import 'package:openflutterecommerce/domain/entities/entity.dart';

class UserOrderEntity extends Entity<int> {
  final int orderNumber;
  final String trackingNumber;
  final int productCount;
  final int promoCodeId;
  final double discountPercent;
  final String discountTitle;
  final int shippingAddressId;
  final String orderStatus;
  final double totalAmount;
  final int deliveryMethodId;
  final double deliveryPrice;

  UserOrderEntity(
      {int id,
      this.orderNumber,
      this.trackingNumber,
      this.productCount,
      this.promoCodeId,
      this.discountPercent,
      this.discountTitle,
      this.shippingAddressId,
      this.orderStatus,
      this.totalAmount,
      this.deliveryMethodId,
      this.deliveryPrice}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'trackingNumber': trackingNumber,
      'productCount': productCount,
      'promoCodeId': promoCodeId,
      'discountPercent': discountPercent,
      'discountTitle': discountTitle,
      'shippingAddressId': shippingAddressId,
      'orderStatus': orderStatus,
      'totalAmount': totalAmount,
      'deliveryMethodId': deliveryMethodId,
      'deliveryPrice': deliveryPrice
    };
  }

  @override
  List<Object> get props => [
        id,
        orderNumber,
        trackingNumber,
        productCount,
        promoCodeId,
        discountPercent,
        discountTitle,
        shippingAddressId,
        orderStatus,
        totalAmount,
        deliveryMethodId,
        deliveryPrice
      ];
}
