// Category List View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../categories.dart';
import '../categories_bloc.dart';
import '../categories_event.dart';
import '../categories_state.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({Key key}) : super(key: key);

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 4;
    var _theme = Theme.of(context);
    return BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
      if (state is CategoryErrorState) {
        return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
                style: _theme.textTheme.display1
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child:
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryListViewState) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
              OpenFlutterButton(
                onPressed: (() => {
                      BlocProvider.of<CategoryBloc>(context)
                          .add(CategoryShowTilesEvent(0)),
                    }),
                title: 'VIEW ALL ITEMS',
                width: widgetWidth,
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sidePadding,
                ),
              ),
              Column(
                children: buildCategoryList(state.categories),
              )
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }

  List<Widget> buildCategoryList(List<ProductCategory> categories) {
    var elements = <Widget>[];
    if ( categories != null ) {
      for (var i = 0; i < categories.length; i++) {
        elements.add(
          InkWell(
            onTap: categories[i].isCategoryContainer
                ? () {
                    BlocProvider.of<CategoryBloc>(context)
                        .add(ChangeCategoryParent(categories[i].id));
                  }
                : () {
                    Navigator.of(context).pushNamed(
                        OpenFlutterEcommerceRoutes.productList,
                        arguments: ProductListScreenParameters(categories[i].id));
                  },
            child: OpenFlutterCatregoryListElement(category: categories[i]),
          ),
        );
      }
    }
    return elements;
  }
}
