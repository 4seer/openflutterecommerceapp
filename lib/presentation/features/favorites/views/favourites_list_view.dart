// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/favorites/favorites.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/blank_product_list_item.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/favorite_product_list_item.dart';

class FavoritesListView extends StatefulWidget {
  const FavoritesListView({Key key}) : super(key: key);

  @override
  _FavoritesListViewState createState() => _FavoritesListViewState();
}

class _FavoritesListViewState extends State<FavoritesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (state.data == null) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: BlankProductListItem(),
              );
            } else {
              return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                  child: FavoriteProductListItem(
                    product: state.data[index].product,
                    showProductInfo: () {
                      Navigator.of(context).pushNamed(
                          OpenFlutterEcommerceRoutes.product,
                          arguments: ProductDetailsParameters(
                              state.data[index].product.id));
                    },
                    onRemoveFromFavorites: () {
                      BlocProvider.of<FavouriteBloc>(context).add(
                          RemoveFromFavoriteEvent(
                              state.data[index].product.id));
                    },
                    onAddToCart: () {
                      BlocProvider.of<FavouriteBloc>(context)
                          .add(AddToCartEvent(state.data[index].product.id));
                    },
                    imageHeight: 100,
                    imageWidth: 120,
                  ));
            }
          },
        ),
      );
    });
  }
}
