import 'package:openflutterecommerce/domain/entities/category.dart';
import 'package:openflutterecommerce/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductsByCategory(Category category);
}
