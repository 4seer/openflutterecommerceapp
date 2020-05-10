// Produt List Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/model/category.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/size_changing_app_bar.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/error_dialog.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'products.dart';

class ProductsScreen extends StatefulWidget {
  final ProductListScreenParameters parameters;

  const ProductsScreen({Key key, this.parameters}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class ProductListScreenParameters {
  final ProductCategory category;

  ProductListScreenParameters(this.category);
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: null,
      body: BlocProvider<ProductsBloc>(
          create: (context) {
            return ProductsBloc(
                category: widget.parameters.category)
              ..add(ScreenLoadedEvent());
          },
          child: BlocConsumer<ProductsBloc, ProductsState>(
            listener: (context, state) {
              if (state.hasError) {
                ErrorDialog.showErrorDialog(context, state.error);
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                slivers: <Widget>[
                  SizeChangingAppBar(
                    title: state.data?.category?.name??'',
                    filterRules: state.filterRules,
                    sortRules: state.sortBy,
                    isListView: state is ProductsListViewState,
                    onFilterRulesChanged: (filter) {
                      BlocProvider.of<ProductsBloc>(context)
                          .add(ProductChangeFilterRulesEvent(filter));
                    },
                    onSortRulesChanged: (sort) {
                      BlocProvider.of<ProductsBloc>(context)
                          .add(ProductChangeSortRulesEvent(sort));
                    },
                    onViewChanged: () {
                      BlocProvider.of<ProductsBloc>(context)
                          .add(ProductsChangeViewEvent());
                    },
                  ),
                  state is ProductsListViewState
                      ? ProductsListView()
                      : ProductsTileView(),
                ],
              );
            },
          )),
      bottomMenuIndex: 1,
    ));
  }
}
