import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

main() {
  group('filter rules categories', () {
    test('if there is null in category filter, hasCategoryFilter returns false',
        () {
      FilterRules filterRules = FilterRules();
      expect(filterRules.hasCategoryFilter, false);
    });

    test('if there is no selected category, hasCategoryFilter returns false',
        () {
      FilterRules filterRules =
          FilterRules(categories: {Category(1): false, Category(2): false});
      expect(filterRules.hasCategoryFilter, false);
    });

    test(
        'if there is at least one selected category, hasCategoryFilter returns true',
        () {
      FilterRules filterRules = FilterRules(categories: {
        Category(1): false,
        Category(2): false,
        Category(3): true
      });
      expect(filterRules.hasCategoryFilter, true);
    });

    test('if there is all categories selected, hasCategoryFilter returns true',
        () {
      FilterRules filterRules = FilterRules(categories: {
        Category(1): true,
        Category(2): true,
        Category(3): true
      });
      expect(filterRules.hasCategoryFilter, true);
    });
  });

  group('filter rules attributes', () {
    test('if there is null in attributes hasAttributesFilter returns false',
        () {
      FilterRules filterRules = FilterRules();
      expect(filterRules.hasAttributesFilter, false);
    });

    test(
        'if there is no selected values for attributes hasAttributesFilter returns false',
        () {
      FilterRules filterRules = FilterRules(selectedAttributes: {
        ProductAttribute(id: 1, name: 'Color'): [],
        ProductAttribute(id: 2, name: 'Size'): [],
      });
      expect(filterRules.hasAttributesFilter, false);
    });

    test(
        'if there is at least one attribute selected hasAttributesFilter returns true',
        () {
      FilterRules filterRules = FilterRules(selectedAttributes: {
        ProductAttribute(id: 1, name: 'Color'): ['Grey'],
        ProductAttribute(id: 2, name: 'Size'): [],
      });
      expect(filterRules.hasAttributesFilter, true);
    });

    test(
        'if there is more then one attribute selected hasAttributesFilter returns true',
        () {
      FilterRules filterRules = FilterRules(selectedAttributes: {
        ProductAttribute(id: 1, name: 'Color'): ['Grey', 'Yellow'],
        ProductAttribute(id: 2, name: 'Size'): ['XL', 'L'],
      });
      expect(filterRules.hasAttributesFilter, true);
    });
  });
}
