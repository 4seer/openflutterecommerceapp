// Produt List Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
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
  final int categoryId;

  ProductListScreenParameters(this.categoryId);
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
                categoryId: widget.parameters.categoryId,
                productRepository:
                    RepositoryProvider.of<ProductRepository>(context),
                categoryRepository:
                    RepositoryProvider.of<CategoryRepository>(context),
                favoritesRepository:
                    RepositoryProvider.of<FavoritesRepository>(context),
                hashtagRepository: HashtagRepository())
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
                  SizeChangingAppBar(),
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
