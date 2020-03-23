// List of products in the card view
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../products.dart';

class ProductsCardView extends StatefulWidget {
  final Function changeView;

  const ProductsCardView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductsCardViewState createState() => _ProductsCardViewState();
}

class _ProductsCardViewState extends State<ProductsCardView> {
  ProductView productView = ProductView.CardView;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    var fullWidth = MediaQuery.of(context).size.width;
    var topPartHeight = 360;
    var _theme = Theme.of(context);
    final bloc = BlocProvider.of<ProductsBloc>(context);
    return BlocListener<ProductsBloc, ProductState>(listener: (context, state) {
      if (state is ProductsErrorState) {
        return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
                style: _theme.textTheme.headline3
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child:
        BlocBuilder<ProductsBloc, ProductState>(builder: (context, state) {
      if (state is ProductsLoadedState) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: AppColors.white,
                  child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                    OpenFlutterBlockHeader(
                      title: state.data.category.name,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: AppSizes.sidePadding)),
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
                                  changeType: ViewChangeType.Exact, index: 2)
                            }),
                        onChangeViewClicked: (() => {
                              widget.changeView(
                                  changeType: ViewChangeType.Backward)
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
                      height:
                          MediaQuery.of(context).size.height - topPartHeight,
                      width: fullWidth,
                      //padding: EdgeInsets.only(top: AppSizes.sidePadding),
                      color: _theme.backgroundColor,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: AppSizes.sidePadding,
                            child: Container(
                              //padding: EdgeInsets.only(left: AppSizes.sidePadding),
                              height: MediaQuery.of(context).size.height -
                                  topPartHeight,
                              width: width,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: width,
                                  height: state.data.products.isNotEmpty
                                      ? width * state.data.products.length
                                      : width * 1.6,
                                  padding: EdgeInsets.only(
                                      top: AppSizes.sidePadding),
                                  //color: _theme.backgroundColor,
                                  child: GridView.extent(
                                    childAspectRatio: 1 / 1.6,
                                    maxCrossAxisExtent: width / 2,
                                    padding: const EdgeInsets.all(4),
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    children: buildProductList(
                                        state.data.products, width),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
            ],
          ),
        );
      }
      return Center(child: CircularProgressIndicator());
    }));
  }

  List<Widget> buildProductList(List<Product> products, double width) {
    var elements = <Widget>[];
    var widgetWidth = (width) / 2;
    var height = widgetWidth * 1.589;
    for (var i = 0; i < products.length; i++) {
      elements.add(OpenFlutterProductCard(
          product: products[i], height: height, width: widgetWidth));
    }
    return elements;
  }
}
