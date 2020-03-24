// Checkout Shipping Address View Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/action_card.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../checkout_bloc.dart';
import '../checkout_event.dart';
import '../checkout_state.dart';

class ShippingAddressView extends StatefulWidget {
  final Function changeView;

  const ShippingAddressView({Key key, this.changeView}) : super(key: key);

  @override
  _ShippingAddressViewState createState() => _ShippingAddressViewState();
}

class _ShippingAddressViewState extends State<ShippingAddressView> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;

    return BlocListener(
        bloc: bloc,
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
            bloc: bloc,
            builder: (BuildContext context, CheckoutState state) {
              return SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Column(
                  children: <Widget>[
                    _buildShippingAddress(_theme, width, bloc, true),
                    _buildShippingAddress(_theme, width, bloc, false),
                    _buildShippingAddress(_theme, width, bloc, false),
                  ],
                ),
                Positioned(
                  bottom: AppSizes.sidePadding,
                  right: AppSizes.sidePadding,
                  child: FloatingActionButton(
                      mini: true,
                      backgroundColor: _theme.primaryColor,
                      onPressed: (() => {
                            widget.changeView(
                                changeType: ViewChangeType.Forward)
                          }),
                      child: Icon(Icons.add, size: 36)),
                ),
              ]));
            }));
  }

  Widget _buildShippingAddress(
      ThemeData _theme, double width, CheckoutBloc bloc, bool checked) {
    return OpenFlutterActionCard(
        title: 'Jane Doe',
        linkText: 'Edit',
        onLinkTap: (() =>
            {widget.changeView(changeType: ViewChangeType.Forward)}),
        child: Column(children: <Widget>[
          RichText(
            text: TextSpan(
                text: '3 Newbridge Court Chino Hills, CA 91709, United States',
                style: _theme.textTheme.display3
                    .copyWith(color: _theme.primaryColor)),
            maxLines: 2,
          ),
          Container(
              width: width,
              alignment: Alignment.centerRight,
              child: OpenFlutterCheckbox(
                  width: width,
                  title: 'Use as the shipping address',
                  checked: checked,
                  onTap: ((bool newValue) =>
                      {_changeDefaultShippingAddress(bloc, 3)}))),
        ]));
  }

  void _changeDefaultShippingAddress(CheckoutBloc bloc, int shippingAddressId) {
    //TODO: pass datat to state
    bloc..add(CheckoutSetDefaultShippingAddressEvent(shippingAddressId));
    widget.changeView(changeType: ViewChangeType.Exact, index: 0);
  }
}
