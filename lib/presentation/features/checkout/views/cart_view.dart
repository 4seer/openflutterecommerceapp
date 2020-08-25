// Checkout Cart View Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/action_card.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/delivery_method.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/payment_card.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/summary_line.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../checkout.dart';

class CartView extends StatefulWidget {
  final Function changeView;

  const CartView({Key key, this.changeView}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;

    return BlocListener(
        cubit: bloc,
        listener: (context, state) {
          if (state is CheckoutErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.display1
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        },
        child: BlocBuilder(
            cubit: bloc,
            builder: (BuildContext context, CheckoutState state) {
              if (state is CheckoutProceedState) {
                return SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    OpenFlutterBlockSubtitle(
                        title: 'Shipping Address', width: width),
                    OpenFlutterActionCard(
                        title: state.currentShippingAddress.fullName,
                        linkText: 'Change',
                        onLinkTap: (() => {
                            widget.changeView(
                              changeType: ViewChangeType.Exact, index: 2)
                          }),
                        child: RichText(
                          text: TextSpan(
                            text: state.currentShippingAddress.toString(),
                            style: _theme.textTheme.display3
                              .copyWith(color: _theme.primaryColor)),
                          maxLines: 2,
                        )),
                    OpenFlutterBlockSubtitle(
                      title: 'Payment',
                      width: width,
                      linkText: 'Change',
                      onLinkTap: (() => {
                        widget.changeView(changeType: ViewChangeType.Forward)
                      }),
                    ),
                    OpenFlutterPaymentCard(
                      cardNumber: state.currentPaymentMethod.toString(),
                    ),
                    OpenFlutterBlockSubtitle(
                      title: 'Delivery Method',
                      width: width,
                      /*linkText: 'Change',
                      onLinkTap: (() => {}),*/
                    ),
                    OpenFlutterDeliveryMethod(),
                    Padding(
                        padding: EdgeInsets.only(top: AppSizes.sidePadding * 3)),
                    OpenFlutterSummaryLine(title: 'Order', summary: '\$' + state.orderPrice.toStringAsFixed(2)),
                    Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                    OpenFlutterSummaryLine(title: 'Delivery', summary: '\$' + state.deliveryPrice.toStringAsFixed(2)),
                    Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                    OpenFlutterSummaryLine(title: 'Summary', summary: '\$' + state.summaryPrice.toStringAsFixed(2)),
                    Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
                    OpenFlutterButton(
                      title: 'SUBMIT ORDER',
                      onPressed: (() => {
                        widget.changeView(
                          changeType: ViewChangeType.Exact, index: 4)
                      }),
                    )
                  ],
                ));
              }
              return Container();
            }));
  }
}
