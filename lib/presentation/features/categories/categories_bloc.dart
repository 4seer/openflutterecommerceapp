// Category list Bloc
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/data/model/category.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:openflutterecommerce/locator.dart';

import 'categories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FindCategoriesByFilterUseCase findCategoriesByFilterUseCase;

  CategoryBloc(): findCategoriesByFilterUseCase = sl();



  @override
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryShowListEvent) {
      if (state is CategoryListViewState) {
        if (state.parentCategoryId != event.parentCategoryId) {
          yield CategoryLoadingState();
          List<ProductCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
          yield CategoryListViewState(
              categories: categories, parentCategoryId: event.parentCategoryId);
        }
      } else {
        yield CategoryLoadingState();
        List<ProductCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
        yield CategoryListViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      }
    } else if (event is CategoryShowTilesEvent) {
      if (state is CategoryTileViewState) {
        if (state.parentCategoryId != event.parentCategoryId) {
          yield CategoryLoadingState();
          List<ProductCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
          yield CategoryTileViewState(
              categories: categories, parentCategoryId: event.parentCategoryId);
        }
      } else {
        yield CategoryLoadingState();
        List<ProductCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
        yield CategoryTileViewState(
          parentCategoryId: event.parentCategoryId, categories: categories);
      }
    } else if (event is ChangeCategoryParent) {
      yield CategoryLoadingState();
      List<ProductCategory> categories = await _getCategoriesByFilter(event.parentCategoryId);
      if (state is CategoryTileViewState) {
        yield CategoryTileViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      } else {
        yield CategoryListViewState(
            parentCategoryId: event.parentCategoryId, categories: categories);
      }
    }
  }
  Future<List<ProductCategory>> _getCategoriesByFilter(int categoryId) async{
    final categoriesData = await findCategoriesByFilterUseCase.execute(
      CategoriesByFilterParams(
        categoryId: categoryId
      )
    );
    return categoriesData.categories;
  }
}
