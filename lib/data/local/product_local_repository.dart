import 'package:openflutterecommerce/domain/entities/category.dart';
import 'package:openflutterecommerce/domain/entities/product.dart';
import 'package:openflutterecommerce/domain/repositories/product_repository.dart';

class ProductLocalRepository implements ProductRepository {
  @override
  Future<List<Product>> getProductsByCategory(Category category) async {
    var apiProducts = await _simulateSelectDatabase();
    return apiProducts.map(_mapDaoToEntity);
  }

  Product _mapDaoToEntity(ProductDao e) => Product(e.id, e.name, null);

  Future<List<ProductDao>> _simulateSelectDatabase() async {
    await Future.delayed(Duration(
      seconds: 2,
    ));
    return [
      ProductDao(1, 'Black T-Short'),
      ProductDao(2, 'Small T-Short'),
    ];
  }
}

class ProductDao {
  final int id;
  final String name;

  ProductDao(
    this.id,
    this.name,
  );
}
