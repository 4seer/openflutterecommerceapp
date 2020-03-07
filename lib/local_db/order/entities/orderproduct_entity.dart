import 'package:openflutterecommerce/local_db/entity.dart';

class OrderProductEntity extends Entity {
  final int id;
  final int productId;
  final int productCount;
  final double totalPrice;
  final String title;
  final double discountPercent;
  final String thumb;

  OrderProductEntity(
      {this.id,
      this.productId,
      this.productCount,
      this.totalPrice,
      this.title,
      this.discountPercent,
      this.thumb});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productCount': productCount,
      'totalPrice': totalPrice,
      'title': title,
      'discountPercent': discountPercent,
      'thumb': thumb,
    };
  }

  @override
  List<Object> get props =>
      [id, productId, productCount, totalPrice, title, discountPercent, thumb];
}
