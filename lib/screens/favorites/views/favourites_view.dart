// Favourites View
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/favorites/views/favourites_list_view.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/scaffold_collapsing.dart';

import '../favorites_bloc.dart';
import '../favorites_event.dart';
import '../favorites_state.dart';
import 'favourites_grid_list.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteBloc, FavouriteState>(listener:
        (context, state) {
      print("BlocListener: ${state}");
      return Container();
    }, child:
        BlocBuilder<FavouriteBloc, FavouriteState>(builder: (context, state) {
      print("BlocBuilder: ${state}");
      return _buildFavouritesHeader(context, state);
    }));
  }

  Widget _buildFavouritesHeader(BuildContext context, FavouriteState state) {
    final bloc = BlocProvider.of<FavouriteBloc>(context);
    final double width = MediaQuery.of(context).size.width;
    final double widgetWidth = width - AppSizes.sidePadding * 2;
    ProductView productView = ProductView.ListView;
    SortBy sortBy = SortBy.Popular;

    return OpenFlutterCollapsingScaffold(
      background: AppColors.background,
      title: "Favourites",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: AppColors.white,
            child: Column(
              children: <Widget>[
                Container(
                    width: width,
                    child: OpenFlutterHashTagList(
                        tags: state is FavouriteInitialState
                            ? state.hashtags
                            : List<HashTag>(),
                        height: 30)),
                Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.sidePadding*2.50, bottom: AppSizes.sidePadding),
                  width: width*0.95,
                  child: OpenFlutterProductFilter(
                    width: width*0.95,
                    height: 20,
                    productView: productView,
                    sortBy: sortBy,
                    onFilterClicked: (() => {print("Filter Clicked")}),
                    onChangeViewClicked: (() {
                      print("Change View Clicked");

                      if (state is FavouriteListViewState) {
                        bloc..add(FavouriteGridViewEvent());
                      } else if (state is FavouriteGridViewState) {
                        bloc..add(FavouriteListViewEvent());
                      }
                    }),
                    onSortClicked: ((SortBy sortBy) => {print("Sort Clicked")}),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildListView(state),
          )
        ],
      ),
      bottomMenuIndex: 1,
    );
  }

  Widget _buildListView(FavouriteState state) {
    print("_buildListView: ${state}");
    if (state is FavouriteListViewState) {
      return FavouritesListView(
          products: state is FavouriteListViewState
              ? state.favouriteProducts
              : List<Product>());
    } else if (state is FavouriteGridViewState) {
      return FavouritesGridList(
          products: state is FavouriteGridViewState
              ? state.favouriteProducts
              : List<Product>());
    } else {
      return Container();
    }
  }
}
