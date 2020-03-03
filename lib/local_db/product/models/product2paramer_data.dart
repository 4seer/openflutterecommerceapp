import 'package:openflutterecommerce/local_db/data_source_model.dart';

class Product2ParameterData extends DataSourceModel {
  final int id;
  final int productParameterId;
  final int productId;

  Product2ParameterData({this.id, this.productParameterId, this.productId});

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
