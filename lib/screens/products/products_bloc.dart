// Product List Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/category_repository.dart';
import 'package:openflutterecommerce/repos/hashtag_repository.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/products/products_event.dart';
import 'package:openflutterecommerce/screens/products/products_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;
  final HashtagRepository hashtagRepository;
  
  ProductBloc(
    {@required this.categoryRepository, 
    @required this.productRepository,
    @required this.hashtagRepository,
  })  : assert(productRepository != null);

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if(event is ProductShowListEvent){
      if ( this.currentState is ProductsListViewState) {
        ProductsListViewState state = this.currentState as ProductsListViewState;
        if ( state.category.id != event.categoryId ) {
          //Set state to loading
          yield state.copyWith(
            loading: true
          );
          //Load data from repositories
          List<Product> products = productRepository.getProducts(event.categoryId);
          List<HashTag> hashtags = hashtagRepository.getHashtags();
          Category category = categoryRepository.getCategoryDetails(event.categoryId);
          //set state to loaded and update data
          yield state.copyWith(
            products: products,
            hashtags: hashtags,
            loading: false,
            category: category
          );
        } 
      } else {
        List<Product> products = productRepository.getProducts(event.categoryId);
        List<HashTag> hashtags = hashtagRepository.getHashtags();
        Category category = categoryRepository.getCategoryDetails(event.categoryId);
        yield ProductsListViewState(
          isLoading: false,
          category: category,
          hashtags: hashtags,
          products: products
        );
      }
    } else if(event is ProductShowCardEvent){
      if ( this.currentState is ProductsCardViewState) {
        ProductsCardViewState state = this.currentState as ProductsCardViewState;
        if ( state.category.id != event.categoryId ) {
          yield state.copyWith(
            loading: true
          );
          List<Product> products = productRepository.getProducts(event.categoryId);
          List<HashTag> hashtags = hashtagRepository.getHashtags();
          Category category = categoryRepository.getCategoryDetails(event.categoryId);
          yield state.copyWith(
            products: products,
            loading: false,
            category: category,
            hashtags: hashtags,
          );
        } 
      } else {
        List<Product> products = productRepository.getProducts(event.categoryId);
        List<HashTag> hashtags = hashtagRepository.getHashtags();
        Category category = categoryRepository.getCategoryDetails(event.categoryId);
        yield ProductsCardViewState(
          isLoading: false,
          category: category,
          hashtags: hashtags,
          products: products
        );
      }
    }
  }
}