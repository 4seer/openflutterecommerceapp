import 'package:openflutterecommerce/local_db/entity.dart';

class OrderProductParameterEntity extends Entity {
  final int id;
  final int productId;
  final int parameterId;
  final int parameterValueId;

  OrderProductParameterEntity(
      {this.id, this.productId, this.parameterId, this.parameterValueId});

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
  List<Object> get props => [id, productId, parameterId, parameterValueId];
}
