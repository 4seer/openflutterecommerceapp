// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/brand.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/category.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/hashtag.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class ProductStateData {
  List<Product> products;
  List<HashTag> hashtags;
  Category category;
}

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductInitialState extends ProductState {}

@immutable
class ProductsLoadedState extends ProductState {
  final ProductStateData data;
  final bool isLoading;
  final bool showSortBy;
  final SortBy sortBy;

  final List<Color> availableColors = [
    Color(0xFF222222),
    Color(0xFFFFFFFF),
    Color(0xFFB82222),
    Color(0xFFBEA9A9),
    Color(0xFFE2BB8D),
    Color(0xFF151867)
  ];

  final List<Color> selectedColors;

  final List<String> availableSizes = ['XS', 'S', 'M', 'L', 'XL'];

  final List<String> selectedSizes;

  final List<Category> availableCategories = [
    Category(id: 1, title: 'Women'),
    Category(id: 2, title: 'Men'),
    Category(id: 3, title: 'Boys'),
    Category(id: 4, title: 'Girls'),
  ];

  final List<Category> selectedCategories;

  final List<Brand> availableBrands = [
    Brand(1, 'Adidas'),
    Brand(2, 'Adidas Originals'),
    Brand(3, 'Blend'),
    Brand(4, 'Boutique Moschino'),
    Brand(5, 'Champion'),
    Brand(6, 'Diesel'),
  ];

  final List<int> selectedBrandIds;

  final RangeValues priceRange;

  final RangeValues availablePriceRange;

  final String brandSearchKey;

  ProductsLoadedState(
      {this.data,
      this.isLoading,
      this.showSortBy,
      this.sortBy,
      this.priceRange,
      @required this.availablePriceRange,
      this.selectedColors,
      this.selectedSizes,
      this.selectedCategories,
      this.selectedBrandIds,
      this.brandSearchKey});

  ProductsLoadedState copyWith(
      {ProductStateData data,
      bool loading,
      bool showSortBy,
      SortBy sortBy,
      RangeValues priceRange,
      RangeValues availablePriceRange,
      List<Color> selectedColors,
      List<String> selectedSizes,
      List<Category> selectedCategories,
      List<int> selectedBrandIds,
      String brandSearchKey}) {
    return ProductsLoadedState(
        data: data ?? this.data,
        isLoading: loading ?? isLoading,
        showSortBy: showSortBy ?? this.showSortBy,
        sortBy: sortBy ?? this.sortBy,
        priceRange: priceRange ?? this.priceRange,
        availablePriceRange: availablePriceRange ?? this.availablePriceRange,
        selectedColors: selectedColors ?? this.selectedColors,
        selectedSizes: selectedSizes ?? this.selectedSizes,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        selectedBrandIds: selectedBrandIds ?? this.selectedBrandIds,
        brandSearchKey: brandSearchKey ?? this.brandSearchKey);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        data,
        isLoading,
        showSortBy,
        sortBy,
        availablePriceRange,
        priceRange,
        selectedColors,
        selectedSizes,
        selectedCategories,
        selectedBrandIds,
        brandSearchKey
      ];
}

@immutable
class ProductsErrorState extends ProductState {}
