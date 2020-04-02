// Favourites Grid list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/product_view.dart';

import '../favorites_bloc.dart';
import '../favorites_event.dart';
import '../favorites_state.dart';

class FavouritesTileView extends StatelessWidget {
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
              child: state.data[index].getTileView(
                context: context,
                showProductInfo: () {
                  Navigator.of(context).pushNamed(
                      OpenFlutterEcommerceRoutes.product,
                      arguments: ProductDetailsParameters(
                          state.data[index].product.id,
                          selectedAttributes: state.data[index].favoriteForm));
                },
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
