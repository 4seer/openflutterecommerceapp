import 'package:openflutterecommerce/domain/entities/entity.dart';

class OrderProductParameterEntity extends Entity<int> {
  final int productId;
  final int parameterId;
  final int parameterValueId;

  OrderProductParameterEntity(
    {int id, 
    this.productId, 
    this.parameterId, 
    this.parameterValueId}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'parameterId': parameterId,
      'parameterValueId': parameterValueId,
    };
  }

  @override
  List<Object> get props => [
    id, 
    productId, 
    parameterId, 
    parameterValueId
  ];
}
