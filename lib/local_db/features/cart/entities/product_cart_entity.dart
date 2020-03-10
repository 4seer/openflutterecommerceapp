import 'package:openflutterecommerce/local_db/entity.dart';

class ProductCartEntity extends Entity {
  final int id;
  final int productId;
  final int productCount;
  final double totalPrice;

  ProductCartEntity(
      {this.id, this.productId, this.productCount, this.totalPrice});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productCount': productCount,
      'totalPrice': totalPrice,
    };
  }

  @override
  List<Object> get props => [id, productId, productCount, totalPrice];
}
