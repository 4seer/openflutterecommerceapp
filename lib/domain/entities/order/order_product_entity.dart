import 'package:openflutterecommerce/domain/entities/entity.dart';

class OrderProductEntity extends Entity<int> {
  final int productId;
  final int productCount;
  final double totalPrice;
  final String title;
  final double discountPercent;
  final String thumb;

  OrderProductEntity(
      {int id,
      this.productId,
      this.productCount,
      this.totalPrice,
      this.title,
      this.discountPercent,
      this.thumb}) : super(id);

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
