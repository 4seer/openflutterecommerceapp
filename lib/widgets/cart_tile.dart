import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/cart_product.dart';
import 'package:openflutterecommerce/widgets/block_header.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class OpenFlutterCartTile extends StatefulWidget {
  final CartProduct item;
  final Function(int quantity) onChangeQuantity;
  final Function(int productId) onAddToFav;
  final Function(int productId) onRemoveFromCart;
  final bool orderComplete;

  const OpenFlutterCartTile({Key key, 
    @required this.item, 
    @required this.onChangeQuantity, 
    @required this.onAddToFav, 
    @required this.onRemoveFromCart, 
    this.orderComplete = false}) : super(key: key);

  @override
  _OpenFlutterCartTileState createState() => _OpenFlutterCartTileState();
}

class _OpenFlutterCartTileState extends State<OpenFlutterCartTile> {
  int quantity;
  bool showPopup = false;

  @override
  void initState() {
    this.quantity = widget.item.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.imageRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray.withOpacity(0.3),
              blurRadius:  AppSizes.imageRadius,
              offset: Offset(0.0,  AppSizes.imageRadius)
            )
          ],
          color: AppColors.white
        ),
        child: Stack (
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 104,
                  child: Image.asset(widget.item.product.image)
                ),
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
                            child:Text(widget.item.product.title,
                              style: _theme.textTheme.headline3.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _theme.primaryColor
                              )
                            ),
                          ),
                          !widget.orderComplete ? 
                            InkWell(
                              onTap: ( () => {
                                //TODO: show popup with add to favs and delete from cart
                                showPopup = !showPopup,
                                setState( () => {})
                              }),
                              child: Icon(Icons.more_vert, size: 24)
                            ) : Container()
                        ]
                      ),
                      
                      Text(
                        widget.item.product.categoryTitle,
                        style: _theme.textTheme.bodyText1
                      ),
                      Padding( padding: EdgeInsets.only(bottom: AppSizes.linePadding*2)),
                      Row(
                        children: <Widget>[
                          Text('Color: ',
                            style: _theme.textTheme.bodyText1),

                          Text(widget.item.color.title,
                            style: _theme.textTheme.bodyText1.copyWith(
                              color: _theme.primaryColor
                            )),

                          Padding(
                            padding: EdgeInsets.only(left: AppSizes.linePadding),
                            child: Text('  Size: ',
                              style: _theme.textTheme.bodyText1)
                          ),

                          Text(widget.item.size,
                            style: _theme.textTheme.bodyText1.copyWith(
                              color: _theme.primaryColor
                            )
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: AppSizes.linePadding*2),),

                      Row(
                        children: <Widget>[
                          widget.onChangeQuantity != null ? 
                            Container(
                              width: 120,
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap:( ()=> {
                                      quantity--,
                                      widget.item.changeQuantity(quantity),
                                      setState(()=>{}),
                                      widget.onChangeQuantity(quantity)
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lightGray.withOpacity(0.3),
                                            blurRadius:  AppSizes.imageRadius,
                                            offset: Offset(0.0,  AppSizes.imageRadius)
                                          )
                                        ]
                                      ),
                                      child: Icon(Icons.remove)
                                    )
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(AppSizes.linePadding*2),
                                    child: Text(quantity.toString(),
                                      style: _theme.textTheme.headline3),
                                  ),
                                  InkWell(
                                    onTap:( ()=> {
                                      quantity++,
                                      widget.item.changeQuantity(quantity),
                                      setState(()=>{}),
                                      widget.onChangeQuantity(quantity)
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lightGray.withOpacity(0.3),
                                            blurRadius:  AppSizes.imageRadius,
                                            offset: Offset(0.0,  AppSizes.imageRadius)
                                          )
                                        ]
                                      ),
                                      child: Icon(Icons.add)
                                    )
                                  ),
                                ],
                              ),
                            ) : 
                            Container(
                              width: 110,
                              child: Row(
                                children: <Widget>[
                                  Text('Units: ',
                                    style: _theme.textTheme.bodyText1),

                                  Text(widget.item.quantity.toString(),
                                    style: _theme.textTheme.bodyText1.copyWith(
                                      color: _theme.primaryColor
                                    )),
                                ]
                              )
                            ),
                          Container(
                            width: width - 280,
                            alignment: Alignment.centerRight,
                            child: Text('\$'+(widget.item.price).toStringAsFixed(0),
                              style: _theme.textTheme.headline3),
                          )
                        ]
                      )
                    ]
                  )
                )
              ],
            ),
            showPopup ?
              Positioned(
                top: 10,
                right: 30,
                child: Container(
                  height: 90,
                  width: 140,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                    color: AppColors.white,
                    border: Border.all(color: _theme.primaryColorLight)
                  ),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: ( () => {
                          widget.onAddToFav(widget.item.product.id),
                          showPopup=false,
                          setState( () => {})
                        }),
                        child: Container(
                          width: 140,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(AppSizes.sidePadding),
                          decoration: new BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: _theme.primaryColorLight, width: 0.4),
                            ),
                          ),
                          child: Text('Add to Favorites')
                        )
                      ),
                      InkWell(
                        onTap: ( () => {
                          widget.onRemoveFromCart(widget.item.product.id),
                          showPopup=false,
                          setState( () => {})
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(AppSizes.sidePadding),
                          child: Text('Remove from Cart')
                        )
                      ),
                    ],
                  )
                )
              ) : Container()
          ]
        )
      )
    );
  }
}