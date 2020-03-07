import 'package:openflutterecommerce/local_db/entity.dart';

class ProductParameterVariantEntity extends Entity {
  final int id;
  final String title;
  final int productParameterId;
  final double additionalPrice;

  ProductParameterVariantEntity(
      {this.id, this.title, this.productParameterId, this.additionalPrice});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'productParameterId': productParameterId,
      'additionalPrice': additionalPrice
    };
  }

  @override
  List<Object> get props => [id, title, productParameterId, additionalPrice];
}
