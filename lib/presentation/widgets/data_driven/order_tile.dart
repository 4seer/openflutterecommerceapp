import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/user_order.dart';

class OpenFlutterOrderTile extends StatelessWidget {
  final UserOrder order;
  final Function(int) onClick;

  const OpenFlutterOrderTile({required this.order, required this.onClick});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
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
                        text: 'Order: ',
                        style: _theme.textTheme.headline4
                            ?.copyWith(color: _theme.primaryColorLight, fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: '#' + order.orderNumber.toString(),
                        style: _theme.textTheme.headline4?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ])),
                    Text(DateFormat('yyyy-MM-dd').format(order.orderDate),
                        style: _theme.textTheme.headline2?.copyWith(color: AppColors.red))
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
                          style: _theme.textTheme.headline4?.copyWith(color: _theme.primaryColorLight),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sidePadding),
                          child: Text(
                            order.trackingNumber,
                            style: _theme.textTheme.headline4,
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
                              style: _theme.textTheme.headline4?.copyWith(color: _theme.primaryColorLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.linePadding),
                              child: Text(
                                order.totalQuantity.toString(),
                                style: _theme.textTheme.headline4,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Totat Amount: ',
                              style: _theme.textTheme.headline4?.copyWith(color: _theme.primaryColorLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.sidePadding),
                              child: Text(
                                '\$' + order.totalPrice.toStringAsFixed(0),
                                //total amount
                                style: _theme.textTheme.headline4,
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
                    MaterialButton(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
                      color: AppColors.white,
                      onPressed: () {
                        onClick(order.id);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                          side: BorderSide(color: AppColors.black, width: 2)),
                      child: Text(
                        'Details',
                        style: _theme.textTheme.headline4,
                      ),
                    ),
                    Text(order.orderStatus.toString().split('.')[1],
                        style: _theme.textTheme.headline4?.copyWith(color: AppColors.green)),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  String getOrderStatusString() {
    var str = 'New';
    switch (order.orderStatus) {
      case UserOrderStatus.Paid:
        str = 'Paid';
        break;
      case UserOrderStatus.Sent:
        str = 'Sent';
        break;
      case UserOrderStatus.Delivered:
        str = 'Delivered';
        break;
      case UserOrderStatus.New:
      default:
        break;
    }
    return str;
  }
}
