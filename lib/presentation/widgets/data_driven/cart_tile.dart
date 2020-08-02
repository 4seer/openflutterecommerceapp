import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/cart_item.dart';
import 'package:openflutterecommerce/presentation/features/cart/views/selected_attribute_view.dart';

class OpenFlutterCartTile extends StatefulWidget {
  final CartItem item;
  final Function(int quantity) onChangeQuantity;
  final Function() onAddToFav;
  final Function() onRemoveFromCart;
  final bool orderComplete;

  const OpenFlutterCartTile(
      {Key key,
      @required this.item,
      @required this.onChangeQuantity,
      @required this.onAddToFav,
      @required this.onRemoveFromCart,
      this.orderComplete = false})
      : super(key: key);

  @override
  _OpenFlutterCartTileState createState() => _OpenFlutterCartTileState();
}

class _OpenFlutterCartTileState extends State<OpenFlutterCartTile> {
  bool showPopup = false;

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppSizes.linePadding * 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.imageRadius),
              boxShadow: [
                BoxShadow(
                    color: AppColors.lightGray.withOpacity(0.3),
                    blurRadius: AppSizes.imageRadius,
                    offset: Offset(0.0, AppSizes.imageRadius))
              ],
              color: AppColors.white),
          child: Stack(children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: 104,
                    child: widget.item.product.mainImage.isLocal
                        ? Image.asset(widget.item.product.mainImage.address)
                        : Image.network(
                            widget.item.product.mainImage.address)),
                Container(
                    padding: EdgeInsets.only(left: AppSizes.sidePadding),
                    width: width - 134,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: width - 173,
                                  child: Text(widget.item.product.title,
                                      style: _theme.textTheme.display1
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: _theme.primaryColor)),
                                ),
                                !widget.orderComplete
                                    ? InkWell(
                                        onTap: (() => {
                                              //TODO: show popup with add to favs and delete from cart
                                              showPopup = !showPopup,
                                              setState(() => {})
                                            }),
                                        child:
                                            Icon(Icons.more_vert, size: 24))
                                    : Container()
                              ]),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: AppSizes.linePadding * 2)),
                          Wrap(
                              children: widget.item.selectedAttributes
                                  .map((key, value) => MapEntry(
                                      key,
                                      SelectedAttributeView(
                                        productAttribute: key,
                                        selectedValue: value,
                                      )))
                                  .values
                                  .toList()),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: AppSizes.linePadding * 2),
                          ),
                          Row(children: <Widget>[
                            widget.onChangeQuantity != null
                                ? Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => {
                                          widget.onChangeQuantity(
                                            widget.item.productQuantity.quantity-1)
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                              BorderRadius.circular(18),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors
                                                  .lightGray
                                                  .withOpacity(
                                                      0.3),
                                                blurRadius: AppSizes
                                                  .imageRadius,
                                                offset: Offset(
                                                  0.0,
                                                  AppSizes
                                                    .imageRadius))
                                            ]),
                                          child: Icon(Icons.remove))),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(
                                            AppSizes.linePadding * 2),
                                        child: Text(widget.item.productQuantity.quantity.toString(),
                                            style:
                                                _theme.textTheme.display1),
                                      ),
                                      InkWell(
                                        onTap: (() => {
                                          widget.onChangeQuantity(
                                            widget.item.productQuantity.quantity+1)
                                        }),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                              BorderRadius.circular(
                                                18),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors
                                                  .lightGray
                                                  .withOpacity(
                                                    0.3),
                                                blurRadius: AppSizes
                                                  .imageRadius,
                                                offset: Offset(
                                                  0.0,
                                                  AppSizes.imageRadius))
                                            ]),
                                          child: Icon(Icons.add))),
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: 110,
                                    child: Row(children: <Widget>[
                                      Text('Units: ',
                                          style: _theme.textTheme.body1),
                                      Text(widget.item.productQuantity.quantity.toString(),
                                          style: _theme.textTheme.body1
                                              .copyWith(
                                                  color:
                                                      _theme.primaryColor)),
                                    ])),
                            Container(
                              width: width - 280,
                              alignment: Alignment.centerRight,
                              child: Text(
                                  '\$' +
                                      (widget.item.price).toStringAsFixed(0),
                                  style: _theme.textTheme.display1),
                            )
                          ])
                        ]))
              ],
            ),
            showPopup
                ? Positioned(
                    top: 10,
                    right: 30,
                    child: Container(
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizes.imageRadius),
                            color: AppColors.white,
                            border:
                                Border.all(color: _theme.primaryColorLight)),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                                onTap: (() => {
                                      widget
                                          .onAddToFav(),
                                      showPopup = false,
                                      setState(() => {})
                                    }),
                                child: Container(
                                    width: 140,
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.all(AppSizes.sidePadding),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: _theme.primaryColorLight,
                                            width: 0.4),
                                      ),
                                    ),
                                    child: Text('Add to Favorites'))),
                            InkWell(
                                onTap: (() => {
                                      widget.onRemoveFromCart(),
                                      showPopup = false,
                                      setState(() => {})
                                    }),
                                child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.all(AppSizes.sidePadding),
                                    child: Text('Remove from Cart'))),
                          ],
                        )))
                : Container()
            ])));
  }
}
