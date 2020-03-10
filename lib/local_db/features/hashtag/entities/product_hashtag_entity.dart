import 'package:openflutterecommerce/local_db/entity.dart';

class ProductHashTagEntity extends Entity {
  final int id;
  final int hashTagId;
  final int productId;

  ProductHashTagEntity({this.id, this.hashTagId, this.productId});

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
