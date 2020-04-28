import 'dart:collection';

import 'package:openflutterecommerce/data/abstract/model/hashtag.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';

import 'category.dart';
import 'product_attribute.dart';

class FilterRules {
  final HashMap<ProductCategory, bool> categories;
  final HashMap<ProductAttribute, List<String>> selectedAttributes;
  final PriceRange selectedPriceRange;
  final List<HashTag> hashTags;

  FilterRules(
      {this.categories, this.hashTags, this.selectedAttributes, this.selectedPriceRange});

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

  /// this behavior can be changed in subclasses to show special attribute instead of first
  MapEntry<ProductAttribute, List<String>> get topmostOption =>
    selectedAttributes != null &&
    selectedAttributes.entries != null &&
      selectedAttributes.entries.isNotEmpty ? 
      selectedAttributes?.entries?.first 
      : MapEntry<ProductAttribute, List<String>>(
        ProductAttribute(name: ''),
        []
      );

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

  factory FilterRules.getSelectableAttributes(List<Product> products) {
    HashMap<ProductAttribute, List<String>> returnAttributes = HashMap();
    //hashmap to store option list by id
    HashMap<int, List<String>> attributesIdToString = HashMap();
    //hashmap to store ProductAttribute by id
    HashMap<int, ProductAttribute> attributesIdToAttribute = HashMap();
    //price ranges
    double maxPrice = 0;
    double minPrice = 0;
    List<int> categoryIds = [];
    HashMap<ProductCategory, bool> categories = HashMap();
    List<int> hashTagIds = [];
    List<HashTag> hashTags = []; 

    products.forEach((product) => {
      product.hashTags != null ?
        product.hashTags.forEach((HashTag hashTag) =>  {
          if ( !hashTagIds.contains(hashTag.id) ) {
            hashTagIds.add(hashTag.id),
            hashTags.add(hashTag)
          }
        }) : { },
      product.selectableAttributes != null ?
       // returnAttributes.addAll({for (var attribute in product.selectableAttributes) attribute: []})
        product.selectableAttributes.forEach((attribute)=> {
          if ( attribute != null ) { 
            if ( attributesIdToString[attribute.id] == null ) {
              attributesIdToString[attribute.id] = [],
              attributesIdToAttribute[attribute.id] = attribute
            },
            attributesIdToString[attribute.id].addAll(attribute.options)
          }
        }) : { },
      if ( product.price > maxPrice ) maxPrice = product.price,
      if ( product.price < minPrice ) minPrice = product.price,
      //TOOD: change to categories instead of categoryIds
      product.categories.forEach((ProductCategory category) =>  {
        if ( !categoryIds.contains(category.id) ) {
          categoryIds.add(category.id),
          categories[category] = true
        }
      })
    });
    attributesIdToString.keys.forEach((attributeById) => {
      returnAttributes[attributesIdToAttribute[attributeById]]=attributesIdToString[attributeById].toSet().toList()
    });

    return  FilterRules(
        categories: categories,
        selectedAttributes: returnAttributes,
        hashTags: hashTags,
        selectedPriceRange: PriceRange(minPrice, maxPrice)
    );
  }
}

class PriceRange {
  final double minPrice;
  final double maxPrice;

  PriceRange(this.minPrice, this.maxPrice);
}
