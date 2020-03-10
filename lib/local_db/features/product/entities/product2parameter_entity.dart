import 'package:openflutterecommerce/local_db/entity.dart';

class Product2ParameterEntity extends Entity {
  final int id;
  final int productParameterId;
  final int productId;

  Product2ParameterEntity({this.id, this.productParameterId, this.productId});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productParameterId': productParameterId,
      'productId': productId,
    };
  }

  @override
  List<Object> get props => [id, productParameterId, productId];
}
