// Category list Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/interfaces/category_repository.dart';

import 'categories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({
    @required CategoryRepository categoryRepository,
  })  : _categoryRepository = categoryRepository,
        assert(categoryRepository != null);

  @override
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryShowListEvent) {
      if (state is CategoryListViewState) {
        var state = this.state as CategoryListViewState;
        if (state.type != event.type) {
          yield CategoryLoadingState();
          var categories = _categoryRepository.getCategories(event.type);
          yield state.copyWith(categories: categories, type: event.type);
        }
      } else {
        var categories = _categoryRepository.getCategories(event.type);
        yield CategoryListViewState(
            isLoading: false, type: event.type, categories: categories);
      }
    } else if (event is CategoryShowTilesEvent) {
      if (state is CategoryTileViewState) {
        var state = this.state as CategoryTileViewState;
        if (state.type != event.type) {
          yield state.copyWith(loading: true);
          var categories = _categoryRepository.getCategories(event.type);
          yield state.copyWith(
              categories: categories, loading: false, type: event.type);
        }
      } else {
        var categories = _categoryRepository.getCategories(event.type);
        yield CategoryTileViewState(
            isLoading: false, type: event.type, categories: categories);
      }
    }
  }
}
