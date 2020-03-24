// Product List Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

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
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductsListEvent event) async* {
    if (event is ScreenLoadedEvent) {
      final data = await getStateData(categoryId);
      yield ProductsLoadedState(
          isLoading: false,
          showSortBy: false,
          sortBy: SortBy.Popular,
          selectedBrandIds: <int>[],
          selectedCategories: <Category>[],
          selectedSizes: <String>[],
          selectedColors: <Color>[],
          priceRange: RangeValues(70, 150),
          availablePriceRange: RangeValues(0, 1000),
          brandSearchKey: '',
          data: data);
    } else if (event is ProductChangeSortByEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(sortBy: event.sortBy, showSortBy: false);
    } else if (event is ProductShowSortByEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(showSortBy: true);
    } else if (event is ProductChangePriceRangeEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(priceRange: event.priceRange);
    } else if (event is ProductChangeSelectedColorsEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedColors: event.selectedColors);
    } else if (event is ProductChangeSelectedSizesEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedSizes: event.selectedSizes);
    } else if (event is ProductChangeSelectedCategoriesEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedCategories: event.selectedCategories);
    } else if (event is ProductChangeSelectedBrandsEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedBrandIds: event.selectedBrandIds);
    } else if (event is ProductChangeBrandSearchKeyEvent) {
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(brandSearchKey: event.newSearchKey);
    } else if (event is MakeFavorite) {
      if (event.isFavorite) {
        await productRepository.addToFavorites(event.productId);
      } else {
        await productRepository.removeFromFavorites(event.productId);
      }
      final state = this.state as ProductsLoadedState;
      yield state.copyWith(data: await getStateData(categoryId));
    }
  }

  Future<ProductStateData> getStateData(int categoryId) async {
    var data = ProductStateData();

    data.products = await productRepository.getProductsInCategory(categoryId);
    data.hashtags = hashtagRepository.getHashtags();
    data.category = await categoryRepository.getCategoryDetails(categoryId);

    return data;
  }
}
