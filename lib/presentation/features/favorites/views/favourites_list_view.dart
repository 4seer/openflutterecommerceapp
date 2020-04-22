// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/presentation/features/favorites/favorites.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/extensions/product_view.dart';

class FavoritesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => state.data[index].getListView(
            context: context,
            showProductInfo: () {
              Navigator.of(context).pushNamed(
                  OpenFlutterEcommerceRoutes.product,
                  arguments: ProductDetailsParameters(
                      state.data[index].product.id,
                      selectedAttributes: state.data[index].favoriteForm));
            },
            onRemoveFromFavorites: () {
              BlocProvider.of<FavouriteBloc>(context)
                  .add(RemoveFromFavoriteEvent(state.data[index].product.id));
            },
            onAddToCart: () {
              BlocProvider.of<FavouriteBloc>(context)
                  .add(AddToCartEvent(state.data[index].product.id));
            },
          ),
          childCount: state.data != null ? state.data.length : 0,
        ),
      );
    });
  }
}
