import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';

class QueryUtils {
  static String formWherePart(
      int categoryId, bool isFavorite, FilterRules filterRules) {
    List<String> whereOptions = [];
    if (filterRules == null || !filterRules.hasCategoryFilter) {
      if (categoryId != 0) {
        whereOptions
            .add('id IN (SELECT productId FROM productCategoryLink WHERE '
                'categoryId = $categoryId)');
      }
    } else {
      StringBuffer categoriesList = StringBuffer('');
      filterRules.categories.forEach((key, value) {
        if (value) {
          categoriesList.write('${key.id}, ');
        }
      });
      whereOptions.add('id IN (SELECT productId FROM productCategoryLink WHERE '
          'categoryId IN (${categoriesList.toString().substring(0, categoriesList.length - 2)}))');
    }
    if (isFavorite) {
      whereOptions.add('isFavorite = 1');
    }
    if (filterRules != null) {
      if (filterRules.selectedPriceRange != null) {
        whereOptions.add('price <= ${filterRules.selectedPriceRange.maxPrice} '
            'AND price >= ${filterRules.selectedPriceRange.minPrice}');
      }
      if (filterRules.hasAttributesFilter) {
        StringBuffer attributeWhere = StringBuffer('');
        filterRules.selectedAttributes.forEach((key, value) => {
              if (value != null && value.isNotEmpty)
                {
                  value.forEach((attributeValue) => attributeWhere.write(
                      '(attributeId=${key.id} AND textValue="$attributeValue") OR '))
                }
            });
        whereOptions.add(
            'id IN (SELECT productId FROM productAttributeLink WHERE '
            '${attributeWhere.toString().substring(0, attributeWhere.length - 4)})');
      }
    }
    if (whereOptions.isEmpty) {
      return '';
    } else if (whereOptions.length == 1) {
      return 'WHERE ${whereOptions.first}';
    } else {
      StringBuffer conditionsUnited = StringBuffer('');
      whereOptions
          .forEach((condition) => conditionsUnited.write('($condition) AND '));
      return 'WHERE ${conditionsUnited.toString().substring(0, conditionsUnited.length - 5)}';
    }
  }

  static String formOrderPart(SortRules sortRules) {
    return '';
  }
}
