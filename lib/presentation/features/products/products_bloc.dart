// Product List Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_result.dart';
import 'package:openflutterecommerce/locator.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';
import 'bloc_list_data.dart';

class ProductsBloc extends Bloc<ProductsListEvent, ProductsState> {
  final FindProductsByFilterUseCase findProductsByFilterUseCase;
  final CategoryRepository categoryRepository;
  final FavoritesRepository favoritesRepository;
  final HashtagRepository hashtagRepository;
  final int categoryId;

  ProductsBloc({
    @required this.categoryId,
    @required this.categoryRepository,
    @required this.favoritesRepository,
    @required this.hashtagRepository,
  }) : findProductsByFilterUseCase = sl();

  @override
  ProductsState get initialState => ProductsListViewState();

  @override
  Stream<ProductsState> mapEventToState(ProductsListEvent event) async* {
    if (event is ScreenLoadedEvent) {
      ProductListData data = await getInitialStateData(categoryId);
      yield ProductsListViewState(
          sortBy: SortRules(),
          data: data,
          filterRules: data.filterRules);
    } else if (event is ProductsChangeViewEvent) {
      if (state is ProductsListViewState) {
        yield (state as ProductsListViewState).getTiles();
      } else {
        yield (state as ProductsTileViewState).getList();
      }
    } else if (event is ProductChangeSortRulesEvent) {
      yield state.getLoading();
      ProductsByFilterResult productResults = await findProductsByFilterUseCase.execute(
        ProductsByFilterParams(
          categoryId: categoryId,
          filterRules: state.filterRules,
          sortBy: event.sortBy
        ));
      final List<Product> filteredData = productResults.products;
      yield state.copyWith(
        sortBy: event.sortBy,
        data: state.data.copyWith(filteredData),
      );
    } else if (event is ProductChangeFilterRulesEvent) {
      yield state.getLoading();
      ProductsByFilterResult productResults = await findProductsByFilterUseCase.execute(
        ProductsByFilterParams(
          categoryId: categoryId,
          filterRules: event.filterRules,
          sortBy: state.sortBy
        ));
      final List<Product> filteredData = productResults.products;
      yield state.copyWith(
          filterRules: event.filterRules,
          data: state.data.copyWith(filteredData));
    } else if (event is MakeFavoriteEvent) {
      if (event.isFavorite) {
        await favoritesRepository.addToFavorites(
            event.productId, event.favoriteAttributes);
      } else {
        await favoritesRepository.removeFromFavorites(event.productId);
      }
      final List<Product> data = state.data.products;
      yield state.copyWith(
          data: state.data.copyWith(data.map((item) {
        if (event.productId == item.id) {
          return item.favorite(event.isFavorite);
        } else {
          return item;
        }
      }).toList(growable: false)));
    }
  }

  Future<ProductListData> getInitialStateData(int categoryId) async {
    ProductsByFilterResult productResults = await findProductsByFilterUseCase.execute(
      ProductsByFilterParams(
        categoryId: categoryId
      )
    );
    return ProductListData(
        productResults.products,
        hashtagRepository.getHashtags(),
        await categoryRepository.getCategoryDetails(categoryId),
        productResults.filterRules);
  }
}
