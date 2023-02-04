import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/model/product_attribute.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../wrapper.dart';
import 'product_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'views/details.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen();

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class ProductDetailsParameters {
  final int productId;
  final int categoryId;
  final Map<ProductAttribute, String>? selectedAttributes;

  const ProductDetailsParameters(this.productId, this.categoryId,
      {this.selectedAttributes});
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductDetailsParameters;
    print('productId: ${args.productId}');
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: '',
      body: BlocProvider<ProductBloc>(
        create: (context) {
          return ProductBloc(productId: args.productId)
            ..add(ProductScreenLoadedEvent(
                productId: args.productId,
                categoryId: args.categoryId));
        },
        child: ProductWrapper(),
      ),
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
            return ProductDetailsView(
                product: state.product,
                similarProducts: state.similarProducts,
                changeView: changePage);
          }
          return Container();
        });
  }
}
