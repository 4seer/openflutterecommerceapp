// Product List Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/category_repository.dart';
import 'package:openflutterecommerce/repos/hashtag_repository.dart';
import 'package:openflutterecommerce/repos/models/brand.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/products/products_event.dart';
import 'package:openflutterecommerce/screens/products/products_state.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;
  final HashtagRepository hashtagRepository;

  ProductBloc({
    @required this.categoryRepository,
    @required this.productRepository,
    @required this.hashtagRepository,
  }) : assert(productRepository != null);

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    ProductStateData data = ProductStateData();
    if ( event is ProductStartEvent){
      data = getStateData(event.categoryId);
      yield ProductsLoadedState(
        isLoading: false,
        showSortBy: false,
        sortBy: SortBy.Popular,
        selectedBrands: List<Brand>(),
        selectedCategories: List<Category>(),
        selectedSizes: List<String>(),
        selectedColors: List<Color>(),
        priceRange: RangeValues(70,150),
        availablePriceRange: RangeValues(0,1000),
        data: data);
    }
    else if ( event is ProductChangeSortByEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(sortBy: event.sortBy, showSortBy: false);
    }
    else if ( event is ProductShowSortByEvent) {
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(showSortBy: true);
    }
    else if ( event is ProductChangePriceRangeEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(priceRange: event.priceRange);
    }
    else if ( event is ProductChangeSelectedColorsEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedColors: event.selectedColors);
    }
    else if ( event is ProductChangeSelectedSizesEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedSizes: event.selectedSizes);
    }
    else if ( event is ProductChangeSelectedCategoriesEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedCategories: event.selectedCategories);
    }
    else if ( event is ProductChangeSelectedBrandsEvent){
      ProductsLoadedState state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedBrands: event.selectedBrands);
    }
  }

  ProductStateData getStateData(int categoryId) {
    ProductStateData data = ProductStateData();

    data.products = productRepository.getProducts(categoryId);
    data.hashtags = hashtagRepository.getHashtags();
    data.category = categoryRepository.getCategoryDetails(categoryId);

    return data;
  }
}
