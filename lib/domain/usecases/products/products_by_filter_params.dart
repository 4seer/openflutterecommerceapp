import 'package:openflutterecommerce/domain/entities/category.dart';

class ProductsByFilterParams {
  final Category category;

  ProductsByFilterParams({
    this.category,
  });

  bool get filterByCategory => category != null;
}