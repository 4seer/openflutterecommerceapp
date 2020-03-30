// Favourites Grid list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/favorites_product_tile.dart';

import '../favorite_bloc.dart';
import '../favorites_event.dart';
import '../favorites_state.dart';

class FavouritesTileView extends StatefulWidget {
  final Function changeView;

  const FavouritesTileView({Key key, this.changeView}) : super(key: key);

  @override
  _FavouritesTileViewState createState() => _FavouritesTileViewState();
}

class _FavouritesTileViewState extends State<FavouritesTileView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 1.589),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: FavoritesProductTile(
                product: state.data[index].product,
                onRemoveFromFavorites: () {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      RemoveFromFavoriteEvent(state.data[index].product.id));
                },
                onAddToCart: () {
                  BlocProvider.of<FavouriteBloc>(context)
                      .add(AddToCartEvent(state.data[index].product.id));
                },
              ),
            );
          },
        ),
      );
    });
  }
}
