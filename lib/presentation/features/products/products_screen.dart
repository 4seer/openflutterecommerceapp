// Produt List Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/fake_model/hashtag_repository.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'products.dart';
import 'views/brands.dart';
import 'views/filters.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;

  const ProductsScreen({Key key, this.categoryId}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: 'Products',
      body: BlocProvider<ProductsBloc>(
          create: (context) {
            return ProductsBloc(
                productRepository:
                    RepositoryProvider.of<ProductRepository>(context),
                categoryRepository:
                    RepositoryProvider.of<CategoryRepository>(context),
                hashtagRepository: HashtagRepository())
              ..add(ScreenLoadedEvent(widget.categoryId));
          },
          child: ProductsWrapper()),
      bottomMenuIndex: 1,
    ));
  }
}

class ProductsWrapper extends StatefulWidget {
  @override
  _ProductsWrapperState createState() => _ProductsWrapperState();
}

class _ProductsWrapperState extends OpenFlutterWrapperState<ProductsWrapper> {
  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductState>(
        bloc: BlocProvider.of<ProductsBloc>(context),
        builder: (BuildContext context, ProductState state) {
          return getPageView(<Widget>[
            ProductsListView(changeView: changePage),
            ProductsCardView(changeView: changePage),
            ProductFilterView(changeView: changePage),
            SelectBrandView(changeView: changePage)
          ]);
        });
  }
}
