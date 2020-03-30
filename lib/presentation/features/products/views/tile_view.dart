// List of products in the card view
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/product_details/product_screen.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/general_product_tile.dart';

import '../products.dart';

class ProductsTileView extends StatefulWidget {
  final Function changeView;

  const ProductsTileView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductsTileViewState createState() => _ProductsTileViewState();
}

class _ProductsTileViewState extends State<ProductsTileView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: AppSizes.tile_width / AppSizes.tile_height,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: GeneralProductTile(
                  onFavoritesClick: () {
                    BlocProvider.of<ProductsBloc>(context).add(
                        MakeFavoriteEvent(
                            !state.data.products[index].isFavorite,
                            state.data.products[index].id));
                  },
                  onClick: () {
                    Navigator.of(context).pushNamed(
                        OpenFlutterEcommerceRoutes.product,
                        arguments: ProductDetailsParameters(
                            state.data.products[index].id));
                  },
                  product: state.data.products[index],
                ));
          },
          childCount: state.data.products.length,
        ),
      );
    });
  }
}
