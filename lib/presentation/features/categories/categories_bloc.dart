// Category list Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';

import 'categories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({
    @required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryShowListEvent) {
      if (state is CategoryListViewState) {
        if (state.parentCategoryId != event.parentCategoryId) {
          yield CategoryLoadingState();
          final categories = await _categoryRepository.getCategories(
              parentCategoryId: event.parentCategoryId);
          yield CategoryListViewState(
              categories: categories, parentCategoryId: event.parentCategoryId);
        }
      } else {
        yield CategoryLoadingState();
        final categories = await _categoryRepository.getCategories(
            parentCategoryId: event.parentCategoryId);
        yield CategoryListViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      }
    } else if (event is CategoryShowTilesEvent) {
      if (state is CategoryTileViewState) {
        if (state.parentCategoryId != event.parentCategoryId) {
          yield CategoryLoadingState();
          final categories = await _categoryRepository.getCategories(
              parentCategoryId: event.parentCategoryId);
          yield CategoryTileViewState(
              categories: categories, parentCategoryId: event.parentCategoryId);
        }
      } else {
        yield CategoryLoadingState();
        final categories = await _categoryRepository.getCategories(
            parentCategoryId: event.parentCategoryId);
        yield CategoryTileViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      }
    } else if (event is ChangeCategoryParent) {
      yield CategoryLoadingState();
      final categories = await _categoryRepository.getCategories(
          parentCategoryId: event.parentCategoryId);
      if (state is CategoryTileViewState) {
        yield CategoryTileViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      } else {
        yield CategoryListViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      }
    }
  }
}
