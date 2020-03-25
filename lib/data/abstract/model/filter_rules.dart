import 'dart:collection';

import 'category.dart';
import 'product_attribute.dart';

class FilterRules {
  final HashMap<Category, bool> categories;
  final HashMap<ProductAttribute, List<String>> selectedAttributes;
  final PriceRange selectedPriceRange;

  FilterRules(
      {this.categories, this.selectedAttributes, this.selectedPriceRange});

  FilterRules copyWithAdditionalAttribute(
      ProductAttribute attribute, String value) {
    HashMap<ProductAttribute, List<String>> updatedAttributes =
        selectedAttributes;
    if (updatedAttributes.containsKey(attribute)) {
      updatedAttributes[attribute].add(value);
    } else {
      updatedAttributes[attribute] = [value];
    }
    return FilterRules(
        categories: categories,
        selectedPriceRange: selectedPriceRange,
        selectedAttributes: updatedAttributes);
  }

  FilterRules copyWithRemovedAttributeValue(
      ProductAttribute attribute, String value) {
    HashMap<ProductAttribute, List<String>> updatedAttributes =
        selectedAttributes;
    updatedAttributes[attribute].remove(value);
    if (updatedAttributes[attribute].isEmpty) {
      updatedAttributes.remove(attribute);
    }
    return FilterRules(
        categories: categories,
        selectedPriceRange: selectedPriceRange,
        selectedAttributes: updatedAttributes);
  }

  FilterRules copyWithPriceRange(PriceRange priceRange) {
    return FilterRules(
        categories: categories,
        selectedPriceRange: priceRange,
        selectedAttributes: selectedAttributes);
  }
}

class PriceRange {
  final double minPrice;
  final double maxPrice;

  PriceRange(this.minPrice, this.maxPrice);
}
