// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/brand.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductStartEvent extends ProductEvent { 
  final int categoryId;

  ProductStartEvent(this.categoryId);
  
  @override
  List<Object> get props => [categoryId];
}

@immutable
class ProductShowSortByEvent extends ProductEvent { }


@immutable
class ProductChangeSortByEvent extends ProductEvent {
  final SortBy sortBy;

  ProductChangeSortByEvent(this.sortBy);
  
  @override
  List<Object> get props => [sortBy];
}

@immutable
class ProductChangePriceRangeEvent extends ProductEvent {
  final RangeValues priceRange;

  ProductChangePriceRangeEvent(this.priceRange);
  
  @override
  List<Object> get props => [priceRange];
}

@immutable
class ProductChangeSelectedColorsEvent extends ProductEvent {
  final List<Color> selectedColors;

  ProductChangeSelectedColorsEvent(this.selectedColors);
  
  @override
  List<Object> get props => [selectedColors];
}

@immutable
class ProductChangeSelectedSizesEvent extends ProductEvent {
  final List<String> selectedSizes;

  ProductChangeSelectedSizesEvent(this.selectedSizes);
  
  @override
  List<Object> get props => [selectedSizes];
}

@immutable
class ProductChangeSelectedCategoriesEvent extends ProductEvent {
  final List<Category> selectedCategories;

  ProductChangeSelectedCategoriesEvent(this.selectedCategories);
  
  @override
  List<Object> get props => [selectedCategories];
}

@immutable
class ProductChangeSelectedBrandsEvent extends ProductEvent {
  final List<Brand> selectedBrands;

  ProductChangeSelectedBrandsEvent(this.selectedBrands);
  
  @override
  List<Object> get props => [selectedBrands];
}

@immutable
class ProductChangeBrandSearchKeyEvent extends ProductEvent {
  final String newSearchKey;

  ProductChangeBrandSearchKeyEvent(this.newSearchKey);
  
  @override
  List<Object> get props => [newSearchKey];
}