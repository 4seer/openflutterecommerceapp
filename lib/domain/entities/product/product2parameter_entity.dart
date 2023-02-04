import 'package:openflutterecommerce/domain/entities/entity.dart';

class Product2ParameterEntity extends Entity<int> {
  final int productParameterId;
  final int productId;

  Product2ParameterEntity(
    {required int id,
    required this.productParameterId,
    required this.productId}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productParameterId': productParameterId,
      'productId': productId,
    };
  }

  @override
  List<Object> get props => [
    id, 
    productParameterId, 
    productId
  ];
}
