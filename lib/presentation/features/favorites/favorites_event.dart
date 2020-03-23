// Favourite Screen Bloc Events
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FavouriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ShowListViewEvent extends FavouriteEvent {
  @override
  String toString() => 'Favourite is Loaded in ListView';
}

@immutable
class ShowTileViewEvent extends FavouriteEvent {
  @override
  String toString() => 'Favourite is Loaded in TileView';
}

class MakeFavoriteEvent extends FavouriteEvent {
  final bool isFavorite;
  final int productId;

  MakeFavoriteEvent(this.isFavorite, this.productId);

  @override
  List<Object> get props => [isFavorite, productId];
}
