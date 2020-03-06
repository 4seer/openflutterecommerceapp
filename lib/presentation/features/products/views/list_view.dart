// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';

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
    final bloc = BlocProvider.of<ProductsBloc>(context);

    var _theme = Theme.of(context);
    return BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProductsErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.headline3
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        },
        child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is ProductsLoadedState) {
                return Container(
                    child: Column(children: <Widget>[
                  Container(
                      color: AppColors.white,
                      child: Column(children: <Widget>[
                        Padding(
                            padding:
                                EdgeInsets.only(top: AppSizes.sidePadding)),
                        OpenFlutterBlockHeader(
                          title: state.data.category.title,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: AppSizes.sidePadding)),
                        Container(
                            width: width,
                            child: OpenFlutterHashTagList(
                                tags: state.data.hashtags, height: 30)),
                        Container(
                          padding: EdgeInsets.only(
                              top: AppSizes.sidePadding,
                              bottom: AppSizes.sidePadding),
                          width: width,
                          child: OpenFlutterProductFilter(
                            width: width,
                            height: 24,
                            productView: productView,
                            sortBy: state.sortBy,
                            onFilterClicked: (() => {
                                  widget.changeView(
                                      changeType: ViewChangeType.Exact,
                                      index: 2)
                                }),
                            onChangeViewClicked: (() => {
                                  widget.changeView(
                                      changeType: ViewChangeType.Forward)
                                }),
                            onSortClicked: ((SortBy sortBy) => {
                                  bloc..add(ProductShowSortByEvent()),
                                }),
                          ),
                        ),
                      ])),
                  state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: MediaQuery.of(context).size.height -
                              topPartHeight,
                          width: fullWidth,
                          padding: EdgeInsets.only(top: AppSizes.sidePadding),
                          color: _theme.backgroundColor,
                          child: Stack(children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.height -
                                    topPartHeight,
                                width: fullWidth,
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: buildProductList(
                                      state.data.products, width),
                                ))),
                            state.showSortBy
                                ? OpenFlutterSortBy(
                                    currentSortBy: state.sortBy,
                                    onSelect: ((SortBy newSortBy) => {
                                          bloc
                                            ..add(ProductChangeSortByEvent(
                                                newSortBy))
                                        }),
                                  )
                                : Container()
                          ]))
                ]));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  List<Widget> buildProductList(List<Product> products, double width) {
    var elements = <Widget>[];
    for (var i = 0; i < products.length; i++) {
      elements.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
          child: OpenFlutterProductTile(
              product: products[i],
              height: 100,
              width: width - AppSizes.sidePadding * 2)));
    }
    return elements;
  }
}
