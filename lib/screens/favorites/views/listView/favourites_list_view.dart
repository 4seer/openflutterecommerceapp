// Favourites List of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/scaffold_collapsing.dart';

import '../../../wrapper.dart';
import '../../favorites_bloc.dart';
import '../../favorites_event.dart';
import '../../favorites_state.dart';
import 'favourites_list_item.dart';

class FavouritesListView extends StatefulWidget {
  final Function({@required ViewChangeType changeType, int index}) changeView;

  final FavouriteState state;
  const FavouritesListView({Key key, this.changeView, this.state})
      : super(key: key);

  @override
  _FavouritesListViewState createState() => _FavouritesListViewState(key: key);
}

class _FavouritesListViewState extends State<FavouritesListView> {
  _FavouritesListViewState({Key key});

  @override
  Widget build(BuildContext context) {
    return _buildFavouritesHeader(context, widget.state);
  }

  Widget _buildFavouritesHeader(BuildContext context, FavouriteState state) {
    final bloc = BlocProvider.of<FavouriteBloc>(context);
    final double width = MediaQuery.of(context).size.width;
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
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: OpenFlutterHashTagList(
                        tags: state is FavouriteListViewState
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
                      print("Show TileView");
                      bloc..add(FavouriteTileViewEvent());
                      widget.changeView(changeType: ViewChangeType.Forward);
                    }),
                    onSortClicked: ((SortBy sortBy) => {print("Sort Clicked")}),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildListView(state, context),
          )
        ],
      ),
      bottomMenuIndex: 3,
    );
  }

  Widget _buildListView(FavouriteState state, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var productTiles = List();
    var product =
        state is FavouriteListViewState ? state.favouriteProducts : List();

    if (product.isNotEmpty) {
      for (int i = 0; i < product.length; i++) {
        productTiles.add(FavouritesListCard(width: width, product: product[i]));
      }
      if (productTiles.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: productTiles.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return productTiles[index];
            },
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
