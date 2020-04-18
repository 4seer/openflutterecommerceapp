import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/woocommerce/models/product_category_model.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories({int parentCategoryId = 0});    
}   


class RemoteCategoryRepository extends CategoryRepository {
  final WoocommercWrapperAbastract woocommerce;

  RemoteCategoryRepository({@required this.woocommerce});

  @override
  Future<List<Category>> getCategories({int parentCategoryId = 0}) async {
    try
    {
      List<dynamic> categoriesData = await woocommerce.getCategoryList();
      List<Category> categories = [];
      for(int i = 0; i < categoriesData.length; i++){
        categories.add(
          Category.fromEntity(ProductCategoryModel.fromJson(categoriesData[i]))
        );
      }
      return categories;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  Future<Category> getCategoryDetails(int categoryId) {
    // TODO: implement getCategoryDetails
    return null;
  }
}
