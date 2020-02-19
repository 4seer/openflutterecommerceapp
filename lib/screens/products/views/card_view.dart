// List of products in the card view
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_card.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/sortby.dart';

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
  SortBy sortBy = SortBy.Popular;

  @override
  Widget build(BuildContext context) {
    final double width =
        MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    final double fullWidth = MediaQuery.of(context).size.width;
    final double topPartHeight = 360 ;
    ThemeData _theme = Theme.of(context);
    final bloc = BlocProvider.of<ProductBloc>(context);
    return BlocListener<ProductBloc, ProductState>(listener: (context, state) {
      if (state is ProductsErrorState) {
        return Container(
          padding: EdgeInsets.all(AppSizes.sidePadding),
          child: Text('An error occured',
              style: _theme.textTheme.headline3
                  .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductsLoadedState) {
        return SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              color: AppColors.white,
              child: Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                OpenFlutterBlockHeader(
                  title: state.data.category.title,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                Container(
                    width: width,
                    child: OpenFlutterHashTagList(tags: state.data.hashtags, height: 30)),
                Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.sidePadding, bottom: AppSizes.sidePadding),
                  width: width,
                  child: OpenFlutterProductFilter(
                    width: width,
                    height: 24,
                    productView: productView,
                    sortBy: sortBy,
                    onFilterClicked: (() => {}),
                    onChangeViewClicked: (() => {
                      widget.changeView(changeType: ViewChangeType.Backward)
                    }),
                    onSortClicked: ((SortBy sortBy) => {
                      bloc
                        ..add(ProductShowSortByEvent()),
                    }),
                  ),
                ),
              ])
            ),
            state.isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  height: MediaQuery.of(context).size.height - topPartHeight,
                  width: fullWidth,
                  //padding: EdgeInsets.only(top: AppSizes.sidePadding),
                  color: _theme.backgroundColor,
                  child:  Stack(
                    children: <Widget>[
                      Positioned(
                        left: AppSizes.sidePadding,
                        child: Container(
                          //padding: EdgeInsets.only(left: AppSizes.sidePadding),
                          height: MediaQuery.of(context).size.height - topPartHeight,
                          width: width,
                          child: SingleChildScrollView(
                            child: Container(
                              width: width,
                              height: state.data.products.length > 0
                                ? width * state.data.products.length
                                : width * 1.6,
                              padding: EdgeInsets.only(top: AppSizes.sidePadding),
                              //color: _theme.backgroundColor,
                              child: GridView.extent(
                                childAspectRatio: 1 / 1.6,
                                maxCrossAxisExtent: width / 2,
                                padding: const EdgeInsets.all(4),
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                children: buildProductList(state.data.products, width)
                                )
                              )
                            )
                        )
                      ),

                      state.showSortBy?    
                        OpenFlutterSortBy(
                          currentSortBy: state.sortBy,
                          onSelect: ( (SortBy newSortBy)=>{
                            bloc..add(ProductChangeSortByEvent(newSortBy))
                          })
                        ) : Container()
                    ]
                  )
              )
            ]
          )
        );
      }
      return Center(child: CircularProgressIndicator());
    }));
  }

  buildProductList(List<Product> products, double width) {
    List<Widget> elements = List<Widget>();
    final double widgetWidth = (width) / 2;
    final double height = widgetWidth * 1.589;
    for (int i = 0; i < products.length; i++) {
      elements.add(OpenFlutterProductCard(
          product: products[i], height: height, width: widgetWidth));
    }
    return elements;
  }
}
