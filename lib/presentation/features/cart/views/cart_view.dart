// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/cart_item.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/promo.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/cart_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/promo_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/bottom_popup.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/summary_line.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../cart.dart';
import '../cart_bloc.dart';
import '../cart_state.dart';

class CartView extends StatefulWidget {
  final List<Product> products;
  final Function changeView;

  const CartView({Key key, this.products, this.changeView}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double totalPrice;
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
                style: _theme.textTheme.display1
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoadedState) {
        totalPrice = 0;
        for (var i = 0; i < state.cartProducts.length; i++) {
          totalPrice += state.cartProducts[i].price;
        }
        return Stack(children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            OpenFlutterBlockHeader(
              width: width,
              title: 'My Bag',
            ),
            Column(children: buildCartItems(state.cartProducts, bloc)),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 3),
            ),
            OpenFlutterInputButton(
              placeHolder: 'Enter your promo code',
              controller: _promoController,
              width: width,
              onClick: (() => {bloc..add(CartShowPopupEvent())}),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding * 3),
            ),
            OpenFlutterSummaryLine(
                title: 'Total amount:',
                summary: '\$' + totalPrice.toStringAsFixed(0)),
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
                  //height: 500,
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
    for (var i = 0; i < items.length; i++) {
      widgets.add(Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.sidePadding, vertical: AppSizes.sidePadding),
          child: OpenFlutterCartTile(
            item: items[i],
            onChangeQuantity: ((int quantity) => {
              bloc
                ..add(CartQuantityChangedEvent(
                  item: items[i], newQuantity: quantity))
            }),
            onAddToFav: () {
              bloc
                ..add(CartAddToFavsEvent(item: items[i]));
            },
            onRemoveFromCart: () {
              bloc
                ..add(CartRemoveFromCartEvent(item: items[i]));
            },
          )));
    }
    return widgets;
  }
}
