// Category list Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/category_repository.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/category.dart';

import 'categories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({
    @required this.categoryRepository,
  }) : assert(categoryRepository != null);

  @override
  CategoryState get initialState => CategoryInitialState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryShowListEvent) {
      if (this.state is CategoryListViewState) {
        CategoryListViewState state = this.state as CategoryListViewState;
        if (state.typeId != event.typeId) {
          yield state.copyWith(loading: true);
          List<Category> categories =
              categoryRepository.getCategories(event.typeId);
          yield state.copyWith(
              categories: categories, loading: false, typeId: event.typeId);
        }
      } else {
        List<Category> categories =
            categoryRepository.getCategories(event.typeId);
        yield CategoryListViewState(
            isLoading: false, typeId: event.typeId, categories: categories);
      }
    } else if (event is CategoryShowTilesEvent) {
      if (this.state is CategoryTileViewState) {
        CategoryTileViewState state = this.state as CategoryTileViewState;
        if (state.typeId != event.typeId) {
          yield state.copyWith(loading: true);
          List<Category> categories =
              categoryRepository.getCategories(event.typeId);
          yield state.copyWith(
              categories: categories, loading: false, typeId: event.typeId);
        }
      } else {
        List<Category> categories =
            categoryRepository.getCategories(event.typeId);
        yield CategoryTileViewState(
            isLoading: false, typeId: event.typeId, categories: categories);
      }
    }
  }
}
