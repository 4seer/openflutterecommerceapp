import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductHashTagEntity extends Entity<int> {
  final int hashTagId;
  final int productId;

  ProductHashTagEntity({int id, this.hashTagId, this.productId}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hashTagId': hashTagId,
      'productId': productId,
    };
  }

  @override
  List<Object> get props => [id, hashTagId, productId];
}
