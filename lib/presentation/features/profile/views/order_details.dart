import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/cart_product.dart';
import 'package:openflutterecommerce/presentation/widgets/cart_tile.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../profile_bloc.dart';
import '../profile_state.dart';

class MyOrderDetailsView extends StatefulWidget {
  final Function changeView;

  const MyOrderDetailsView({Key key, @required this.changeView})
      : super(key: key);

  @override
  _MyOrderDetailsViewState createState() => _MyOrderDetailsViewState();
}

class _MyOrderDetailsViewState extends State<MyOrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileMyOrderDetailsState) {
            return Padding(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Order: ",
                              style: _theme.textTheme.headline3,
                            ),
                            TextSpan(
                              text:
                                  "#" + state.orderData.orderNumber.toString(),
                              style: _theme.textTheme.headline3
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ])),
                          Text(
                              DateFormat('yyyy-MM-dd')
                                  .format(state.orderData.orderDate),
                              style: _theme.textTheme.headline5
                                  .copyWith(color: AppColors.lightGray))
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Tacking Number: ',
                                style: _theme.textTheme.headline3
                                    .copyWith(color: _theme.primaryColorLight),
                              ),
                              TextSpan(
                                text: state.orderData.trackingNumber,
                                style: _theme.textTheme.headline3,
                              ),
                            ])),
                            Text('Delivered',
                                style: _theme.textTheme.headline3
                                    .copyWith(color: AppColors.green)),
                          ]),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                state.orderData.quantity.toString(),
                                style: _theme.textTheme.headline3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppSizes.linePadding),
                                child: Text(
                                  'items',
                                  style: _theme.textTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      Column(
                        children: <Widget>[
                          for (CartProduct item in state.orderData.products)
                            OpenFlutterCartTile(
                              item: item,
                              onAddToFav: null,
                              onChangeQuantity: null,
                              onRemoveFromCart: null,
                              orderComplete: true,
                            )
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      buildSummaryLine(
                          'Shipping Address:',
                          state.orderData.shippingAddress.toString(),
                          _theme,
                          width),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      buildSummaryLine('Payment Methods:',
                          state.orderData.paymentMethod, _theme, width),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      buildSummaryLine('Discount:',
                          state.orderData.promo.toString(), _theme, width),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      buildSummaryLine(
                          'Total Amount:',
                          '\$' + state.orderData.totalAmount.toStringAsFixed(0),
                          _theme,
                          width),
                      SizedBox(
                        height: AppSizes.sidePadding,
                      ),
                      Row(children: <Widget>[
                        OpenFlutterButton(
                          backgroundColor: AppColors.white,
                          borderColor: _theme.primaryColor,
                          textColor: _theme.primaryColor,
                          height: 36,
                          width: (width - AppSizes.sidePadding * 3) / 2,
                          title: 'Reorder',
                          onPressed: (() => {
                                //TODO: reorder process
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: AppSizes.sidePadding),
                        ),
                        OpenFlutterButton(
                          height: 36,
                          width: (width - AppSizes.sidePadding * 3) / 2,
                          title: 'Leave Feedback',
                          onPressed: (() => {
                                //TODO: leave feedback
                              }),
                        )
                      ])
                    ],
                  ),
                ));
          }
          return Container();
        });
  }

  buildSummaryLine(String label, String text, ThemeData _theme, double width) {
    print(label + ' ' + text);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: _theme.textTheme.headline3
                .copyWith(color: _theme.primaryColorLight),
          ),
          Container(
            width: width / 2,
            child: Text(
              text,
              style: _theme.textTheme.headline3,
            ),
          )
        ]);
  }
}
