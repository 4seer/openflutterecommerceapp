import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/user_order.dart';

class OpenFlutterOrderTile extends StatelessWidget {
  final UserOrder order;
  final Function(int) onClick;

  const OpenFlutterOrderTile(
      {Key key, @required this.order, @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
        padding: EdgeInsets.all(AppSizes.imageRadius),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _theme.primaryColor.withOpacity(0.3),
                blurRadius: AppSizes.imageRadius,
              )
            ],
            borderRadius: BorderRadius.circular(AppSizes.imageRadius),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Order: ",
                        style: _theme.textTheme.headline3.copyWith(
                            color: _theme.primaryColorLight,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: "#" + order.orderNumber.toString(),
                        style: _theme.textTheme.headline3
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ])),
                    Text(DateFormat('yyyy-MM-dd').format(order.orderDate),
                        style: _theme.textTheme.headline5
                            .copyWith(color: AppColors.red))
                  ],
                ),
                SizedBox(
                  height: AppSizes.linePadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Tacking Number: ',
                          style: _theme.textTheme.headline3
                              .copyWith(color: _theme.primaryColorLight),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: AppSizes.sidePadding),
                          child: Text(
                            order.trackingNumber,
                            style: _theme.textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.sidePadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Quantity: ',
                              style: _theme.textTheme.headline3
                                  .copyWith(color: _theme.primaryColorLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppSizes.linePadding),
                              child: Text(
                                order.quantity.toString(),
                                style: _theme.textTheme.headline3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Totat Amount: ',
                              style: _theme.textTheme.headline3
                                  .copyWith(color: _theme.primaryColorLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppSizes.sidePadding),
                              child: Text(
                                '\$' + order.totalAmount.toStringAsFixed(0),
                                //total amount
                                style: _theme.textTheme.headline3,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.linePadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 10, bottom: 10),
                      color: AppColors.white,
                      onPressed: () {
                        this.onClick(order.id);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(AppSizes.imageRadius),
                          side: BorderSide(color: AppColors.black, width: 2)),
                      child: new Text(
                        'Details',
                        style: _theme.textTheme.headline3,
                      ),
                    ),
                    Text(order.orderStatus.toString().split(".")[1],
                        style: _theme.textTheme.headline3
                            .copyWith(color: AppColors.green)),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  getOrderStatusString() {
    String str = "New";
    switch (order.orderStatus) {
      case UserOrderStatus.Paid:
        str = "Paid";
        break;
      case UserOrderStatus.Sent:
        str = "Sent";
        break;
      case UserOrderStatus.Delivered:
        str = "Delivered";
        break;
      case UserOrderStatus.New:
      default:
        break;
    }
    return str;
  }
}
