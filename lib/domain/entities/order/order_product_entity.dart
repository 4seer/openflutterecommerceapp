import 'package:openflutterecommerce/domain/entities/entity.dart';

class OrderProductEntity extends Entity<int> {
  final int productId;
  final int productCount;
  final double totalPrice;
  final String title;
  final double discountPercent;
  final String thumb;

  OrderProductEntity(
      {required int id,
      required this.productId,
      required this.productCount,
      required this.totalPrice,
      required this.title,
      required this.discountPercent,
      required this.thumb}) : super(id);

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
