import 'package:openflutterecommerce/domain/entities/category.dart';
import 'package:openflutterecommerce/domain/entities/product.dart';
import 'package:openflutterecommerce/domain/repositories/product_repository.dart';

class ProductRemoteRepository implements ProductRepository {
  @override
  Future<List<Product>> getProductsByCategory(Category category) async {
    var apiProducts = await _simulateApi();
    return apiProducts.map(_mapApiToEntity);
  }

  Product _mapApiToEntity(ProductApiDto e) =>
      Product(e.identifier, e.productTitle, null);

  Future<List<ProductApiDto>> _simulateApi() async {
    await Future.delayed(Duration(
      seconds: 2,
    ));
    return [
      ProductApiDto(1, "Black T-Short"),
      ProductApiDto(2, "Small T-Short"),
    ];
  }
}

class ProductApiDto {
  final int identifier;
  final String productTitle;

  ProductApiDto(
    this.identifier,
    this.productTitle,
  );
}
