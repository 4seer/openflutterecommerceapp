import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../wrapper.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'views/details.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetailsParameters parameters;

  const ProductDetailsScreen(
    this.parameters, {
    Key key,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class ProductDetailsParameters {
  final int productId;

  const ProductDetailsParameters(this.productId);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print("productId: ${widget.parameters.productId}");
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: null,
      body: BlocProvider<ProductBloc>(
          create: (context) {
            return ProductBloc(
                productId: widget.parameters.productId,
                productRepository:
                    RepositoryProvider.of<ProductRepository>(context))
              ..add(ScreenLoadedEvent());
          },
          child: ProductWrapper()),
      bottomMenuIndex: 1,
    ));
  }
}

class ProductWrapper extends StatefulWidget {
  @override
  _ProductWrapperState createState() => _ProductWrapperState();
}

class _ProductWrapperState extends OpenFlutterWrapperState<ProductWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        bloc: BlocProvider.of<ProductBloc>(context),
        builder: (BuildContext context, ProductState state) {
          if (state is ProductLoadedState) {
            return getPageView(<Widget>[
              ProductDetailsView(
                  product: state.product,
                  similarProducts: state.similarProducts,
                  changeView: changePage),
            ]);
          }
          return Container();
        });
  }
}
