import 'dart:collection';

import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/favorite_product.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/local/local_product_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/locator.dart';

//Uses remote or local data depending on NetworkStatus
class ProductRepositoryImpl extends ProductRepository with FavoritesRepository {

  final ProductDataStorage _dataStorage = ProductDataStorage();
  
  @override
  Future<Product> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSimilarProducts(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size}) {
    // TODO: implement getSimilarProducts
    throw UnimplementedError();
  }

  @override
  Future<FilterRules> getPossibleFilterOptions(int categoryId) async {
    HashMap<ProductAttribute, List<String>> result = HashMap();
    //TODO: init categories from list of products fetched from server
    return FilterRules(
        categories: HashMap(),
        selectedAttributes: result,
        selectedPriceRange: PriceRange(10, 100));
  }

  @override
  Future<List<Product>> getProducts(
      {int pageIndex = 0,
      int pageSize = AppConsts.page_size,
      int categoryId = 0,
      bool isFavorite = false,
      SortRules sortRules = const SortRules(),
      FilterRules filterRules}) async {
    // TODO: implement getProducts
    try
    {
      NetworkStatus networkStatus = sl();
      ProductRepository productRepository;
      if ( networkStatus.isConnected != null ) {
        productRepository = RemoteProductRepository(woocommerce: sl());
      } else {
        productRepository = LocalProductRepository();
      }

      _dataStorage.products = await productRepository.getProducts();

      return _dataStorage.products;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future addToFavorites(int productId, HashMap<ProductAttribute, String> selectedAttributes) async {
    Product product;

    _dataStorage.products?.forEach((tempProduct) =>{
        if ( tempProduct.id == productId)
          product = tempProduct
    });

    _dataStorage.favProducts.add(FavoriteProduct(product, selectedAttributes));
  }

  @override
  Future<List<FavoriteProduct>> getFavoriteProducts({int pageIndex = 0, int pageSize = AppConsts.page_size, 
      SortRules sortRules = const SortRules(), FilterRules filterRules}) async {
    //TODO: remove when favorite feature will be implemented
    _dataStorage.products = await getProducts();
    _dataStorage.products.forEach((product) => 
      _dataStorage.favProducts.add(FavoriteProduct(product, HashMap())));
    return _dataStorage.favProducts;
  }

  @override
  Future<FilterRules> getFavoritesFilterOptions() async {
    //TODO: remove when favorite feature will be implemented
    return FilterRules.getSelectableAttributes(_dataStorage.products);
  }

  @override
  Future removeFromFavorites(int productId) {
    // TODO: implement removeFromFavorites
    return null;
  }
}

class ProductDataStorage {
  List<Product> products = [];
  List<FavoriteProduct> favProducts = [];
}