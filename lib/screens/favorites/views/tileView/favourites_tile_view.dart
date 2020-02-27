// Favourites Grid list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/favorites/views/tileView/favourites_tile_item.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/scaffold_collapsing.dart';

import '../../../wrapper.dart';
import '../../favorites_bloc.dart';
import '../../favorites_event.dart';
import '../../favorites_state.dart';

class FavouritesTileView extends StatefulWidget {
  final Function({@required ViewChangeType changeType, int index}) changeView;

  final FavouriteState state;
  const FavouritesTileView({Key key, this.changeView, this.state})
      : super(key: key);

  @override
  _FavouritesTileViewState createState() => _FavouritesTileViewState();
}

class _FavouritesTileViewState extends State<FavouritesTileView> {
  _FavouritesTileViewState({Key key});

  @override
  Widget build(BuildContext context) {
    return _buildFavouritesHeader(context, widget.state);
  }

  Widget _buildFavouritesHeader(BuildContext context, FavouriteState state) {
    final bloc = BlocProvider.of<FavouriteBloc>(context);
    final double width = MediaQuery.of(context).size.width;
    ProductView productView = ProductView.CardView;
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
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: OpenFlutterHashTagList(
                        tags: state is FavouriteTileViewState
                            ? state.hashtags
                            : List(),
                        height: 30)),
                Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.sidePadding * 2.50,
                      bottom: AppSizes.sidePadding),
                  width: width * 0.95,
                  child: OpenFlutterProductFilter(
                    width: width * 0.95,
                    height: 20,
                    productView: productView,
                    sortBy: sortBy,
                    onFilterClicked: (() => {print("Filter Clicked")}),
                    onChangeViewClicked: (() {
                      print("Show ListView");
                      bloc..add(FavouriteListViewEvent());
                      widget.changeView(changeType: ViewChangeType.Backward);
                    }),
                    onSortClicked: ((SortBy sortBy) => {print("Sort Clicked")}),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTileView(state, context),
          )
        ],
      ),
      bottomMenuIndex: 3,
    );
  }

  Widget _buildTileView(FavouriteState state, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var productTiles = List();
    var products = state is FavouriteTileViewState
        ? state.favouriteProducts
        : List<Product>();

    if (products.isNotEmpty) {
      for (int i = 0; i < products.length; i++) {
        productTiles.add(FavouritesTileItem(
            width: width, height: height, product: products[i]));
      }
      if (productTiles.isNotEmpty) {
        return new GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: width / height * 1.05,
          ),
          padding: const EdgeInsets.only(left: 4.0),
          itemCount: productTiles.length,
          itemBuilder: (context, i) => productTiles[i],
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
