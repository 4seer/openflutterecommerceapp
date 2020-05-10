// Favourites Screen Bloc States
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/favorite_product.dart';
import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/hashtag.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';

@immutable
class FavouriteState extends Equatable {
  final List<FavoriteProduct> data;
  final List<HashTag> hashtags;
  final SortRules sortBy;
  final FilterRules filterRules;
  final String error;
  final bool isList;

  FavouriteState(
      {this.data,
      this.hashtags,
      this.sortBy,
      this.filterRules,
      this.error,
      this.isList = true});

  FavouriteState copyWith({
    List<FavoriteProduct> data,
    List<HashTag> hashtags,
    SortRules sortBy,
    FilterRules filterRules,
    String error,
    bool isList,
  }) {
    return FavouriteState(
        data: data ?? this.data,
        hashtags: hashtags ?? this.hashtags,
        sortBy: sortBy ?? this.sortBy,
        filterRules: filterRules ?? this.filterRules,
        isList: isList ?? this.isList);
  }

  bool get isProductsLoading => data == null;
  bool get isFilterRulesVisible => filterRules != null;
  bool get hasError => error != null;

  FavouriteState getLoading() {
    return copyWith(data: []);
  }

  @override
  List<Object> get props => [data, hashtags, sortBy, filterRules, error, isProductsLoading];
}
