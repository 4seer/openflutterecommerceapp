import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';
import 'package:openflutterecommerce/data/woocommerce/models/product_category_model.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories({int parentCategoryId = 0});    
}   


class RemoteCategoryRepository extends CategoryRepository {
  final WoocommercWrapperAbastract woocommerce;

  RemoteCategoryRepository({@required this.woocommerce});

  @override
  Future<Either<Failure, List<Category>>> getCategories({int parentCategoryId = 0}) async {
    try
    {
      List<dynamic> categoriesData = await woocommerce.getCategoryList();
      List<Category> categories = List<Category>();
      for(int i = 0; i < categoriesData.length; i++){
        categories.add(
          Category.fromEntity(ProductCategoryModel.fromJson(categoriesData[i]))
        );
      }
      return Right(categories);
    } on HttpRequestException {
      return Left(RemoteServerFailure());
    }
  }

  @override
  Future<Category> getCategoryDetails(int categoryId) {
    // TODO: implement getCategoryDetails
    return null;
  }
}
