// Category list screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/loading_view.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'categories.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoriesParameters parameters;

  const CategoriesScreen({Key key, this.parameters}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class CategoriesParameters {
  final int categoryId;

  const CategoriesParameters(this.categoryId);
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget parameters at categories screen ${widget.parameters}');
    return SafeArea(
        child: BlocProvider<CategoryBloc>(
            create: (context) {
              return CategoryBloc(
                  categoryRepository:
                      RepositoryProvider.of<CategoryRepository>(context))
                ..add(CategoryShowListEvent(widget.parameters == null
                    ? 0
                    : widget.parameters.categoryId));
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
    return BlocListener<CategoryBloc, CategoryState>(
        child: getPageView(<Widget>[
          LoadingView(),
          buildListScreen(context),
          CategoriesTileView(changeView: changePage),
        ]),
        listener: (BuildContext context, CategoryState state) {
          final index = state is CategoryLoadingState
              ? 0
              : state is CategoryListViewState ? 1 : 2;
          changePage(changeType: ViewChangeType.Exact, index: index);
        });
  }

  Widget buildListScreen(BuildContext context) {
    return OpenFlutterScaffold(
      background: null,
      title: 'Categories',
      body: CategoriesListView(),
      bottomMenuIndex: 1,
    );
  }
}
