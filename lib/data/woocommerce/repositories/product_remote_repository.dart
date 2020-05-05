import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/woocommerce/models/product_model.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';

class RemoteProductRepository extends ProductRepository {
  
  final WoocommercWrapperAbstract woocommerce;

  RemoteProductRepository({@required this.woocommerce});

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
  Future<FilterRules> getPossibleFilterOptions(int categoryId) {
    // TODO: implement getPossibleFilterOptions
    return null;
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
      List<dynamic> productsData = await woocommerce.getProductList(
        ProductsByFilterParams(
          categoryId: categoryId,
          sortBy: sortRules, 
          filterRules: filterRules, 
        )
      );
      List<Product> products = [];
      for(int i = 0; i < productsData.length; i++){
        products.add(
          Product.fromEntity(ProductModel.fromJson(productsData[i]))
        );
      }
      return products;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}
