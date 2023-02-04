import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductCartEntity extends Entity<int> {
  final int productId;
  final int productCount;
  final double totalPrice;

  ProductCartEntity(
    {required int id,
    required this.productId,
    required this.productCount,
    required this.totalPrice}) : super(id);

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
  List<Object> get props => [
    id, 
    productId, 
    productCount, 
    totalPrice
  ];
}
