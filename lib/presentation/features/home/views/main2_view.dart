// Home Screen View #2: small top banner, list of products sale and new
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/presentation/features/categories/categories.dart';
import 'package:openflutterecommerce/presentation/features/home/home_bloc.dart';
import 'package:openflutterecommerce/presentation/features/home/home_event.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class Main2View extends StatefulWidget {
  final Function? changeView;
  final List<Product>? salesProducts;
  final List<Product>? newProducts;

  const Main2View({ this.changeView, this.salesProducts, this.newProducts}) ;

  @override
  _Main2ViewState createState() => _Main2ViewState();
}

class _Main2ViewState extends State<Main2View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          height: width * 0.52,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/splash/topbanner.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: AppSizes.sidePadding),
                  width: width,
                  child: Text('Street clothes', style: _theme.textTheme.headline5?.copyWith(fontSize: 34)))
            ],
          )),
      OpenFlutterBlockHeader(
        width: widgetWidth,
        title: 'Sale',
        linkText: 'View All',
        onLinkTap: () =>
            {Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop, arguments: CategoriesParameters(2))},
        description: 'Super summer sale',
      ),
      OpenFlutterProductListView(
          width: widgetWidth,
          products: widget.salesProducts!,
          onFavoritesTap: ((Product product) => {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeAddToFavoriteEvent(isFavorite: !product.isFavorite, product: product))
              })),
      Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
      OpenFlutterBlockHeader(
        width: widgetWidth,
        title: 'New',
        linkText: 'View All',
        onLinkTap: () =>
            {Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop, arguments: CategoriesParameters(3))},
        description: 'You’ve never seen it before!',
      ),
      OpenFlutterProductListView(
        width: widgetWidth,
        products: widget.newProducts!,
        onFavoritesTap: ((Product product) => {
              BlocProvider.of<HomeBloc>(context)
                  .add(HomeAddToFavoriteEvent(isFavorite: !product.isFavorite, product: product))
            }),
      ),
      OpenFlutterButton(
        title: 'Next Home Page',
        width: 160,
        height: 48,
        onPressed: (() => widget.changeView!(changeType: ViewChangeType.Forward)),
      )
    ]));
  }
}
