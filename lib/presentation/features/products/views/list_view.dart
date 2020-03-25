// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../products.dart';

class ProductsListView extends StatefulWidget {
  final Function({@required ViewChangeType changeType, int index}) changeView;

  const ProductsListView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  ProductView productView = ProductView.ListView;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    var fullWidth = MediaQuery.of(context).size.width;
    var topPartHeight = 360;

    var _theme = Theme.of(context);
    return BlocListener<ProductsBloc, ProductState>(listener: (context, state) {
      if (state is ProductsErrorState) {
        return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
                style: _theme.textTheme.display1
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child:
        BlocBuilder<ProductsBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductsReadyState) {
        return Container(
            child: Column(children: <Widget>[
          Container(
              color: AppColors.white,
              child: Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                OpenFlutterBlockHeader(
                  title: state.data.category.name,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                Container(
                    width: width,
                    child: OpenFlutterHashTagList(
                        tags: state.data.hashtags, height: 30)),
                Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.sidePadding, bottom: AppSizes.sidePadding),
                  width: width,
                  child: OpenFlutterProductFilter(
                    width: width,
                    height: 24,
                    productView: productView,
                    selectedSortRules: state.sortBy,
                    onFilterClicked: (() => {
                          widget.changeView(
                              changeType: ViewChangeType.Exact, index: 2)
                        }),
                    onChangeViewClicked: (() => {
                          widget.changeView(changeType: ViewChangeType.Forward)
                        }),
                    onSortClicked: ((SortRules sortBy) => {
                          BlocProvider.of<ProductsBloc>(context)
                              .add(ProductShowSortByEvent()),
                        }),
                  ),
                ),
              ])),
          Container(
              height: MediaQuery.of(context).size.height - topPartHeight,
              width: fullWidth,
              padding: EdgeInsets.only(top: AppSizes.sidePadding),
              color: _theme.backgroundColor,
              child: Stack(children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height - topPartHeight,
                    width: fullWidth,
                    child: SingleChildScrollView(
                        child: Column(
                      children: buildProductList(
                          state.data.products, state.data.category, width),
                    ))),
                state.screenType == ScreenType.sort
                    ? OpenFlutterSortBy(
                        currentSortBy: state.sortBy,
                        onSelect: ((SortRules newSortBy) => {
                              BlocProvider.of<ProductsBloc>(context)
                                  .add(ProductChangeSortRulesEvent(newSortBy))
                            }),
                      )
                    : Container()
              ]))
        ]));
      }
      return Center(child: CircularProgressIndicator());
    }));
  }

  List<Widget> buildProductList(
      List<Product> products, Category category, double width) {
    var elements = <Widget>[];
    for (var i = 0; i < products.length; i++) {
      elements.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
          child: OpenFlutterProductTile(
              product: products[i],
              category: category,
              onFavClicked: () {
                BlocProvider.of<ProductsBloc>(context).add(
                    MakeFavoriteEvent(!products[i].isFavorite, products[i].id));
              },
              height: 100,
              width: width - AppSizes.sidePadding * 2)));
    }
    return elements;
  }
}
