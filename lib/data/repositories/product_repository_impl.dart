import 'dart:collection';

import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/favorite_product.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/hashtag.dart';
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

  static ProductDataStorage dataStorage = ProductDataStorage();
  
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
        hashTags: [],
        selectedHashTags: HashMap<HashTag, bool>(),
        selectableAttributes: result,
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

      List<Product> products = await productRepository.getProducts();

      //check favorites
      dataStorage.products = [];
      products.forEach( (product) =>{
        dataStorage.products.add(
          product.copyWith(
            isFavorite: checkFavorite(product.id)
          )
        )
      }); 

      return dataStorage.products;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future addToFavorites(Product product, HashMap<ProductAttribute, String> selectedAttributes) async {
    dataStorage.favProducts.add(FavoriteProduct(product, selectedAttributes));
  }

  @override
  Future<List<FavoriteProduct>> getFavoriteProducts({int pageIndex = 0, int pageSize = AppConsts.page_size, 
      SortRules sortRules = const SortRules(), FilterRules filterRules}) async {
    //TODO: remove when favorite feature will be implemented
    /*_dataStorage.products = await getProducts();
    _dataStorage.products.forEach((product) => 
      _dataStorage.favProducts.add(FavoriteProduct(product, HashMap())));*/
    return dataStorage.favProducts;
  }

  @override
  Future<FilterRules> getFavoritesFilterOptions() async {
    //TODO: remove when favorite feature will be implemented
    return FilterRules.getSelectableAttributes(dataStorage.products);
  }

  @override
  Future<List<FavoriteProduct>> removeFromFavorites(int productId) async {
    //TODO: remove from database in the future
    dataStorage.favProducts.removeWhere((product) => product.product.id == productId);
    return dataStorage.favProducts;
  }

  @override
  bool checkFavorite(int productId) {
    // TODO: implement checkFavorite
    bool isFavorite = false;
    for( int i = 0; i < dataStorage.favProducts.length; i++) {
      if ( dataStorage.favProducts[i].product.id == productId) {
        isFavorite = true;
        break;
      }
    }
    return isFavorite;
  }
}

class ProductDataStorage {
  List<Product> products = [];
  List<FavoriteProduct> favProducts = [];
}