import 'package:openflutterecommerce/data/repositories/abstract/category_repository.dart';
/// # Find Categories by Filter Use Case Implementation
/// 2.1. Display category list use-case: User on the home page clicks “View All”, 
/// categories are loaded and displayed in a list. 
/// Complete list of use cases
/// https://medium.com/@openflutterproject/open-flutter-project-e-commerce-app-use-cases-and-features-6b7414a6e708

import 'package:openflutterecommerce/data/model/category.dart';
import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/categories/categories_by_filter_result.dart';
import 'package:openflutterecommerce/locator.dart';

abstract class FindCategoriesByFilterUseCase
  implements BaseUseCase<CategoriesByFilterResult, CategoriesByFilterParams> {}

    
class FindCategoriesByFilterUseCaseImpl implements FindCategoriesByFilterUseCase {
  @override
  Future<CategoriesByFilterResult> execute(CategoriesByFilterParams params) async {
    try {
      CategoryRepository _categoryRepository = sl();
      List<ProductCategory> categories = await _categoryRepository.getCategories(parentCategoryId: params.categoryId);
      return CategoriesByFilterResult(
        categories,
        categories.length
      );
      
    } catch (e) {
      return CategoriesByFilterResult(  
        null,
        0,
        exception: EmptyCategoriesException()
      );
    }
  }
}

class EmptyCategoriesException implements Exception {}