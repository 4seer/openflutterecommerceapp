// Product List Screen View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/clickable_line.dart';
import 'package:openflutterecommerce/widgets/hashtag_list.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/product_tile.dart';

import '../products.dart';


class ProductsListView extends StatefulWidget {
  final Function({@required ViewChangeType changeType, int index}) changeView;

  const ProductsListView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  ProductView productView = ProductView.ListView;
  SortBy sortBy = SortBy.Popular;

  @override
  Widget build(BuildContext context) {
    final double width =
        MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    final bloc = BlocProvider.of<ProductBloc>(context);
    ThemeData _theme = Theme.of(context);
    return BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProductsErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.subtitle
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        },
        child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is ProductsListViewState) {
                return SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      color: AppColors.white,
                      child: Column(children: <Widget>[
                        Padding(
                            padding:
                                EdgeInsets.only(top: AppSizes.sidePadding)),
                        OpenFlutterBlockHeader(
                          title: state.category.title,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: AppSizes.sidePadding)),
                        Container(
                            width: width,
                            child:
                            OpenFlutterHashTagList(tags: state.hashtags, height: 30)),
                        Container(
                          padding: EdgeInsets.only(
                              top: AppSizes.sidePadding,
                              bottom: AppSizes.sidePadding),
                          width: width,
                          child: OpenFlutterProductFilter(
                            width: width,
                            height: 24,
                            productView: productView,
                            sortBy: sortBy,
                            onFilterClicked: (() => {}),
                            onChangeViewClicked: (() => {
                                  bloc
                                    ..add(ProductShowCardEvent(
                                        state.category.id, sortBy)),
                                  widget.changeView(
                                      changeType: ViewChangeType.Forward)
                                }),
                            onSortClicked: ((SortBy sortBy) => {}),
                          ),
                        ),
                      ])),
                    state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: MediaQuery.of(context).size.height - 350,
                          padding: EdgeInsets.only(top: AppSizes.sidePadding),
                          color: _theme.backgroundColor,
                          child:  Stack(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height - 350,
                                child: Column(
                                  children: buildProductList(state.products, width),
                                )
                              ),
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

  List<Widget> buildSortBy(double width, ProductBloc bloc, int categoryId){
    List<String> sortByVariantTitles = ["Popular", "Newest", "Customer Review","Price: lowest to hight", "Price: highest to low"];
    List<SortBy> sortByVariants = [SortBy.Popular, SortBy.Newest, SortBy.CustomerReview, SortBy.PriceLowestToHigh, SortBy.PriceHighestToLow];
    List<Widget> widgets = List<Widget>();
    for(int i = 0; i< sortByVariants.length && i < sortByVariantTitles.length; i++){
      widgets.add(
        OpenFlutterClickableLine(
          height: 58,
          width: width,
          title: sortByVariantTitles[i],
          onTap: ( () => {
            bloc..add(ProductChangeSortByEvent(categoryId, sortByVariants[i]))
          }))
      );
    }
    return widgets;
  }

  buildProductList(List<Product> products, double width) {
    List<Widget> elements = List<Widget>();
    for (int i = 0; i < products.length; i++) {
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
