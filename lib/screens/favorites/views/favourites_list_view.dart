// Favourites List of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/scaffold_collapsing.dart';

import '../../wrapper.dart';
import '../favorites_bloc.dart';
import '../favorites_state.dart';
import 'favourites_list_item.dart';

class FavouritesListView extends StatefulWidget {
  final double width;

  final Function({@required ViewChangeType changeType, int index}) changeView;

  const FavouritesListView({Key key, this.changeView, this.width})
      : super(key: key);

  @override
  _FavouritesListViewState createState() =>
      _FavouritesListViewState(key: key, width: width);
}

class _FavouritesListViewState extends State<FavouritesListView> {
  final double width;
  final double height = 284;
  final double elementHeight = 184;
  final double elementWidth = 148;

  _FavouritesListViewState({Key key, this.width});

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
                      print("Change View Clicked");

                      widget.changeView(changeType: ViewChangeType.Forward);
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
      bottomMenuIndex: 3,
    );
  }

  Widget _buildListView(FavouriteState state) {
    print("_buildListView: ${state}");
    var productTiles = List();
    var product =
        state is FavouriteListViewState ? state.favouriteProducts : List();

    if (product.isNotEmpty) {
      for (int i = 0; i < product.length; i++) {
        productTiles.add(FavouritesListCard(
            width: elementWidth,
            height: elementHeight,
            product: product[i]));
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
