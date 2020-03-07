// Home Screen View #1: Big top banner, list of products
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/models/product_cart.dart';
import 'package:openflutterecommerce/repos/models/promo_code.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/product_cart.dart';
import 'package:openflutterecommerce/widgets/product_list_view.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class CartView extends StatefulWidget {
  final List<Product> products;
  final Function changeView;

  const CartView({Key key, this.products, this.changeView}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  ThemeData _theme;
  double width;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'My Bag',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    _cartListView,
                    //  _promoCodeView,
                    _promoCodeView,
                    _totalAmountView,
                    _checkoutButton
                  ]))),
    );
  }

  Widget get _checkoutButton => OpenFlutterButton(
      title: 'CHECK OUT',
      height: 48,
      onPressed: () {
        List<PromoCode> promos = [
          PromoCode(
              id: 0,
              title: "Personal Offer",
              promoCode: "myPromoCode2020",
              expiryDate: "6 days remaining",
              offerPercentage: "10"),
          PromoCode(
              id: 0,
              title: "Season Offer",
              promoCode: "promo2020",
              expiryDate: "2 days remaining",
              offerPercentage: "15")
        ];

        showPromoCodesBottomSheet(promos);
      });

  Widget get _promoCodeView => Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Enter Your Promo Code",
                    labelStyle: _theme.textTheme.bodyText1),
                style: _theme.textTheme.bodyText1,
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              mini: true,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
  Widget get _totalAmountView => Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Total Amount",
              style: _theme.textTheme.subtitle2,
            ),
            Text(
              "\$52.0",
              style: _theme.textTheme.subtitle2,
            ),
          ],
        ),
      );
  Widget get _cartListView => ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return OpenFlutterProductCartCard(
            productCart: ProductCart(
                id: 1,
                image: "assets/thumbs/dress/dress2.png",
                color: "black",
                size: "L",
                price: 43.0,
                currency: "\$",
                title: "Pullover"),
          );
        },
        itemCount: 3,
        shrinkWrap: true,
      );

  void showPromoCodesBottomSheet(List<PromoCode> promoCodesList) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(249, 249, 249, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20.0))),
              child: ListView(
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 6,
                      width: 60,
                      color: Color(0xFF737373),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: _promoCodeView,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 18),
                    child: Text(
                      "Your Promo Codes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: promoCodesList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 12, bottom: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: width / 5,
                                width: width / 5,
                                color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      promoCodesList[index].offerPercentage,
                                      style: TextStyle(
                                          fontSize: 34, color: Colors.white),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          "%",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "off",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      promoCodesList[index].title,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      promoCodesList[index].promoCode,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        promoCodesList[index].expiryDate,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey),
                                      ),
                                    ),
                                    OpenFlutterButton(
                                      title: "Apply",
                                      width: 93,
                                      height: 36,
                                      onPressed: () {},
                                      isNeedPadding: false,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
