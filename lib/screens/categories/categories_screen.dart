// Category list screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/category_repository.dart';
import 'package:openflutterecommerce/screens/categories/categories.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import 'categories.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider<CategoryBloc>(
            create: (context) {
              return CategoryBloc(categoryRepository: CategoryRepository())
                ..add(CategoryShowListEvent(4));
            },
            child: CategoriesWrapper()));
  }
}

class CategoriesWrapper extends StatefulWidget {
  @override
  _CategoriesWrapperState createState() => _CategoriesWrapperState();
}

class _CategoriesWrapperState
    extends OpenFlutterWrapperState<CategoriesWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
      return getPageView(<Widget>[
        buildListScreen(context),
        CategoriesTileView(changeView: changePage),
      ]);
    });
  }

  buildListScreen(BuildContext context) {
    return OpenFlutterScaffold(
      background: null,
      title: "Categories",
      body: CategoriesListView(changeView: changePage),
      bottomMenuIndex: 1,
    );
  }
}
