import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/entities/query_utils.dart';

main() {
  group('formWherePart', () {
    test('returns correct result for single favorite condition', () {
      expect(QueryUtils.formWherePart(0, true, FilterRules()),
          'WHERE isFavorite = 1');
    });

    test('returns correct result for single category condition', () {
      expect(QueryUtils.formWherePart(1, false, FilterRules()),
          'WHERE id IN (SELECT productId FROM productCategoryLink WHERE categoryId = 1)');
    });

    test(
        'returns correct result for single filter condition with one selected attribute option',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              false,
              FilterRules(selectedAttributes: {
                ProductAttribute(id: 1, name: 'size'): ['XL']
              })),
          'WHERE id IN (SELECT productId FROM productAttributeLink WHERE (attributeId=1 AND textValue="XL"))');
    });

    test(
        'returns correct result for single filter condition with multiple selected attribute options',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              false,
              FilterRules(selectedAttributes: {
                ProductAttribute(id: 1, name: 'size'): ['XL', 'L']
              })),
          'WHERE id IN (SELECT productId FROM productAttributeLink WHERE '
          '(attributeId=1 AND textValue="XL") OR (attributeId=1 AND textValue="L"))');
    });

    test(
        'returns correct result for single filter condition with multiple selected attributes',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              false,
              FilterRules(selectedAttributes: {
                ProductAttribute(id: 1, name: 'size'): ['XL'],
                ProductAttribute(id: 2, name: 'color'): ['white']
              })),
          'WHERE id IN (SELECT productId FROM productAttributeLink WHERE '
          '(attributeId=1 AND textValue="XL") OR (attributeId=2 AND textValue="white"))');
    });

    test('returns correct result for single filter condition with price range',
        () {
      expect(
          QueryUtils.formWherePart(
              0, false, FilterRules(selectedPriceRange: PriceRange(10, 100))),
          'WHERE price <= 100.0 AND price >= 10.0');
    });

    test(
        'returns correct result for single filter condition with a selected subcategory',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              false,
              FilterRules(categories: {
                Category(1): false,
                Category(2): true,
                Category(3): false
              })),
          'WHERE id IN (SELECT productId FROM productCategoryLink WHERE categoryId IN (2))');
    });

    test(
        'returns correct result for single filter condition with some selected subcategories',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              false,
              FilterRules(categories: {
                Category(1): false,
                Category(2): true,
                Category(3): true
              })),
          'WHERE id IN (SELECT productId FROM productCategoryLink WHERE categoryId IN (2, 3))');
    });

    test(
        'returns correct result when there are selected subcategories and main category',
        () {
      expect(
          QueryUtils.formWherePart(
              2,
              false,
              FilterRules(categories: {
                Category(4): false,
                Category(5): true,
                Category(6): true
              })),
          'WHERE id IN (SELECT productId FROM productCategoryLink WHERE categoryId IN (5, 6))');
    });

    test(
        'returns correct result when there are multiple filter rules (category and favorite)',
        () {
      expect(
          QueryUtils.formWherePart(
              0,
              true,
              FilterRules(categories: {
                Category(1): false,
                Category(2): true,
                Category(3): true
              })),
          'WHERE (id IN (SELECT productId FROM productCategoryLink WHERE categoryId IN (2, 3))) AND (isFavorite = 1)');
    });

    test(
        'returns correct result when there are multiple filter rules (category and attributes)',
        () {
      expect(
          QueryUtils.formWherePart(
            0,
            false,
            FilterRules(
              categories: {
                Category(1): false,
                Category(2): true,
                Category(3): false
              },
              selectedAttributes: {
                ProductAttribute(id: 10, name: 'color'): ['pink'],
                ProductAttribute(id: 11, name: 'material'): [],
              },
            ),
          ),
          'WHERE (id IN (SELECT productId FROM productCategoryLink WHERE categoryId IN (2))) '
          'AND (id IN (SELECT productId FROM productAttributeLink WHERE '
          '(attributeId=10 AND textValue="pink")))');
    });
  });

  group('formOrderPart', () {});
}
