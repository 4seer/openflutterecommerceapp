import 'category.dart';
import 'product_attribute.dart';

class FilterRules {
  final Map<Category, bool> categories;
  final Map<ProductAttribute, List<String>> selectedAttributes;
  final PriceRange selectedPriceRange;

  FilterRules(
      {this.categories, this.selectedAttributes, this.selectedPriceRange});

  bool get hasCategoryFilter => !(categories == null ||
      categories.isEmpty ||
      categories.values.fold(true, (value, listItem) => value && !listItem));

  bool get hasAttributesFilter =>
      selectedAttributes != null &&
      selectedAttributes.isNotEmpty &&
      selectedAttributes.values.fold(
          false, (value, list) => value || (list != null && list.isNotEmpty));

  FilterRules copyWithAdditionalAttribute(
      ProductAttribute attribute, String value) {
    Map<ProductAttribute, List<String>> updatedAttributes = selectedAttributes;
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

  /// this behavior can be changed in subclasses to show special attribute instead of first
  MapEntry<ProductAttribute, List<String>> get topmostOption =>
      selectedAttributes?.entries?.first;

  FilterRules copyWithRemovedAttributeValue(
      ProductAttribute attribute, String value) {
    Map<ProductAttribute, List<String>> updatedAttributes = selectedAttributes;
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
