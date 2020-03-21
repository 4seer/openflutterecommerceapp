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

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;
  final HashtagRepository hashtagRepository;

  ProductsBloc({
    @required this.categoryRepository,
    @required this.productRepository,
    @required this.hashtagRepository,
  }) : assert(productRepository != null);

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    var data = ProductStateData();
    if (event is ProductStartEvent) {
      data = await getStateData(event.categoryId);
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
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(sortBy: event.sortBy, showSortBy: false);
    } else if (event is ProductShowSortByEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(showSortBy: true);
    } else if (event is ProductChangePriceRangeEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(priceRange: event.priceRange);
    } else if (event is ProductChangeSelectedColorsEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedColors: event.selectedColors);
    } else if (event is ProductChangeSelectedSizesEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedSizes: event.selectedSizes);
    } else if (event is ProductChangeSelectedCategoriesEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedCategories: event.selectedCategories);
    } else if (event is ProductChangeSelectedBrandsEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(selectedBrandIds: event.selectedBrandIds);
    } else if (event is ProductChangeBrandSearchKeyEvent) {
      var state = this.state as ProductsLoadedState;
      yield state.copyWith(brandSearchKey: event.newSearchKey);
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
