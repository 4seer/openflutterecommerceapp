// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/data/model/product.dart';
import 'package:openflutterecommerce/data/model/promo.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/cart_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/promo_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/summary_line.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../cart.dart';

class CartView extends StatefulWidget {
  final List<Product> products;
  final Function changeView;

  const CartView({Key key, this.products, this.changeView}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  TextEditingController _promoController;

  @override
  void initState() {
    _promoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _promoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<CartBloc>(context);
    return BlocListener<CartBloc, CartState>(listener: (context, state) {
      if (state is CartErrorState) {
        return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
                style: _theme.textTheme.headline4
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoadedState) {
        return Stack(children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            OpenFlutterBlockHeader(
              width: width,
              title: 'My Cart',
            ),
            Column(children: buildCartItems(state.cartProducts, bloc)),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 3),
            ),
            OpenFlutterInputButton(
              placeHolder: state.appliedPromo != null
                  ? state.appliedPromo.promoCode
                  : 'Enter your promo code',
              controller: _promoController,
              width: width,
              onClick: (() => {bloc..add(CartShowPopupEvent())}),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 3),
            ),
            state.appliedPromo != null
                ? Column(children: <Widget>[
                    OpenFlutterSummaryLine(
                        title: 'Subtotal:',
                        summary: '\$' + state.totalPrice?.toStringAsFixed(2)),
                    OpenFlutterSummaryLine(
                        title: 'Discount percent:',
                        summary:
                            state.appliedPromo.discount.toStringAsFixed(0) +
                                '%'),
                    OpenFlutterSummaryLine(
                        title: 'Total amount:',
                        summary:
                            '\$' + state.calculatedPrice?.toStringAsFixed(2)),
                  ])
                : OpenFlutterSummaryLine(
                    title: 'Subtotal:',
                    summary: '\$' + state.totalPrice?.toStringAsFixed(2)),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 3),
            ),
            OpenFlutterButton(
              onPressed: (() => {
                    Navigator.of(context)
                        .pushNamed(OpenFlutterEcommerceRoutes.checkout)
                  }),
              title: 'CHECK OUT',
            )
          ])),
          state.showPromoPopup
              ? OpenFlutterBottomPopup(
                  title: '',
                  child: Column(
                    children: <Widget>[
                      OpenFlutterInputButton(
                        placeHolder: 'Enter your promo code',
                        controller: _promoController,
                        width: width,
                        onClick: (() => {
                              bloc
                                ..add(CartPromoCodeAppliedEvent(
                                    //TODO: check that code is valid
                                    promoCode: _promoController.text))
                            }),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: AppSizes.sidePadding)),
                      OpenFlutterBlockSubtitle(
                        width: width,
                        title: 'Your Promo Codes',
                      ),
                      Column(children: buildPromos(state.promos, bloc))
                    ],
                  ),
                )
              : Container()
        ]);
      }
      return Container();
    }));
  }

  List<Widget> buildPromos(List<Promo> promos, CartBloc bloc) {
    var widgets = <Widget>[];
    for (var i = 0; i < promos.length; i++) {
      widgets.add(Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.sidePadding, vertical: AppSizes.sidePadding),
          child: OpenFlutterPromoTile(
            textColor: promos[i].textColor,
            item: promos[i],
            onClickApply: (() =>
                {bloc..add(CartPromoAppliedEvent(promo: promos[i]))}),
          )));
    }
    return widgets;
  }

  List<Widget> buildCartItems(List<CartItem> items, CartBloc bloc) {
    var widgets = <Widget>[];
    if (items.isNotEmpty) {
      for (var i = 0; i < items.length; i++) {
        widgets.add(Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.sidePadding,
                vertical: AppSizes.sidePadding),
            child: OpenFlutterCartTile(
              item: items[i],
              onChangeQuantity: ((int quantity) => {
                    bloc
                      ..add(CartQuantityChangedEvent(
                          item: items[i], newQuantity: quantity)),
                    if (quantity < 1)
                      {
                        items.remove(items[i]),
                      }
                  }),
              onAddToFav: () {
                bloc..add(CartAddToFavsEvent(item: items[i]));
              },
              onRemoveFromCart: () {
                bloc..add(CartRemoveFromCartEvent(item: items[i]));
                items.remove(items[i]);
              },
            )));
      }
    }
    return widgets;
  }
}
