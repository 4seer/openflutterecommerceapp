// Product List Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

@immutable
abstract class ProductsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ScreenLoadedEvent extends ProductsListEvent {
  ScreenLoadedEvent();

  @override
  List<Object> get props => [];
}

@immutable
class ProductShowSortByEvent extends ProductsListEvent {}

@immutable
class ProductChangeSortByEvent extends ProductsListEvent {
  final SortBy sortBy;

  ProductChangeSortByEvent(this.sortBy);

  @override
  List<Object> get props => [sortBy];
}

@immutable
class ProductChangePriceRangeEvent extends ProductsListEvent {
  final RangeValues priceRange;

  ProductChangePriceRangeEvent(this.priceRange);

  @override
  List<Object> get props => [priceRange];
}

@immutable
class ProductChangeSelectedColorsEvent extends ProductsListEvent {
  final List<Color> selectedColors;

  ProductChangeSelectedColorsEvent(this.selectedColors);

  @override
  List<Object> get props => [selectedColors];
}

@immutable
class ProductChangeSelectedSizesEvent extends ProductsListEvent {
  final List<String> selectedSizes;

  ProductChangeSelectedSizesEvent(this.selectedSizes);

  @override
  List<Object> get props => [selectedSizes];
}

@immutable
class ProductChangeSelectedCategoriesEvent extends ProductsListEvent {
  final List<Category> selectedCategories;

  ProductChangeSelectedCategoriesEvent(this.selectedCategories);

  @override
  List<Object> get props => [selectedCategories];
}

@immutable
class ProductChangeSelectedBrandsEvent extends ProductsListEvent {
  final List<int> selectedBrandIds;

  ProductChangeSelectedBrandsEvent(this.selectedBrandIds);

  @override
  List<Object> get props => [selectedBrandIds];
}

@immutable
class ProductChangeBrandSearchKeyEvent extends ProductsListEvent {
  final String newSearchKey;

  ProductChangeBrandSearchKeyEvent(this.newSearchKey);

  @override
  List<Object> get props => [newSearchKey];
}

class MakeFavorite extends ProductsListEvent {
  final bool isFavorite;
  final int productId;

  MakeFavorite(this.isFavorite, this.productId);

  @override
  List<Object> get props => [isFavorite, productId];
}
