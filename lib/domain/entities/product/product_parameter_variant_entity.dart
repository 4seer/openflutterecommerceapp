import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductParameterVariantEntity extends Entity<int> {
  final String title;
  final int productParameterId;
  final double additionalPrice;

  ProductParameterVariantEntity(
      {required int id,
      required this.title,
      required this.productParameterId,
      required this.additionalPrice}) : super(id);

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
  List<Object> get props => [
    id, 
    title, 
    productParameterId, 
    additionalPrice
  ];
}
