// Product List Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';

import 'bloc_list_data.dart';

class ProductsBloc extends Bloc<ProductsListEvent, ProductState> {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;
  final HashtagRepository hashtagRepository;
  final int categoryId;

  ProductsBloc({
    @required this.categoryId,
    @required this.categoryRepository,
    @required this.productRepository,
    @required this.hashtagRepository,
  }) : assert(productRepository != null);

  @override
  ProductState get initialState => ProductLoadingState();

  @override
  Stream<ProductState> mapEventToState(ProductsListEvent event) async* {
    if (event is ScreenLoadedEvent) {
      yield ProductsReadyState(
          screenType: ScreenType.list,
          sortBy: SortRules(),
          data: await getInitialStateData(categoryId),
          filterRules:
              await productRepository.getPossibleFilterOptions(categoryId));
    } else if (event is ProductChangeSortRulesEvent) {
      final state = this.state as ProductsReadyState;
      yield ProductLoadingState();
      final List<Product> filteredData = await productRepository.getProducts(
          categoryId: categoryId,
          filterRules: state.filterRules,
          sortRules: event.sortBy);
      yield state.copyWith(
          sortBy: event.sortBy,
          data: state.data.copyWith(filteredData),
          showSortBy: false);
    } else if (event is ProductShowSortByEvent) {
      final state = this.state as ProductsReadyState;
      yield state.copyWith(showSortBy: true);
    } else if (event is ProductChangeFilterRulesEvent) {
      final state = this.state as ProductsReadyState;
      yield ProductLoadingState();
      final List<Product> filteredData = await productRepository.getProducts(
          categoryId: categoryId,
          filterRules: event.filterRules,
          sortRules: state.sortBy);
      yield state.copyWith(
          filterRules: event.filterRules,
          data: state.data.copyWith(filteredData));
    } else if (event is MakeFavoriteEvent) {
      if (event.isFavorite) {
        await productRepository.addToFavorites(event.productId);
      } else {
        await productRepository.removeFromFavorites(event.productId);
      }
      final state = this.state as ProductsReadyState;
      yield state.copyWith(data: await getInitialStateData(categoryId));
    }
  }

  Future<ProductListData> getInitialStateData(int categoryId) async {
    return ProductListData(
        await productRepository.getProducts(categoryId: categoryId),
        hashtagRepository.getHashtags(),
        await categoryRepository.getCategoryDetails(categoryId));
  }
}
