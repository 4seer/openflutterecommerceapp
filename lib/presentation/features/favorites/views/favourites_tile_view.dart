// Favourites Grid list of products and on Favourites screen
// Author: umair_adil@live.com
// Date: 2020-02-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/widgets/scaffold_collapsing.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../favorites_bloc.dart';
import '../favorites_event.dart';
import '../favorites_state.dart';

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
            child: GridView.extent(
                childAspectRatio: 1 / 1.8,
                maxCrossAxisExtent: width / 2,
                padding: const EdgeInsets.all(4),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                shrinkWrap: true,
                children: buildProductList(state, width)),
          )
        ],
      ),
      bottomMenuIndex: 3,
    );
  }

  buildProductList(FavouriteState state, double width) {
    List<Widget> elements = List<Widget>();
    final double widgetWidth = (width) / 2;
    final double height = widgetWidth * 1.789;
    var products = state is FavouriteTileViewState
        ? state.favouriteProducts
        : List<Product>();
    for (int i = 0; i < products.length; i++) {
      elements.add(OpenFlutterProductCard(
        product: products[i],
        height: height,
        width: widgetWidth,
        showCartButton: true,
        showRemoveButton: true,
        showColorAndSize: true,
        showRatingInLine: true,
        showTopLabel: true,
        showCategoryFirst: true,
      ));
    }
    return elements;
  }
}
