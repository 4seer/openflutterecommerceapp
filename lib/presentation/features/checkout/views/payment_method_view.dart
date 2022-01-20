// Checkout Payment Method View Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-17

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/bottom_popup.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/payment_card_preview.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../checkout.dart';
import '../checkout_bloc.dart';
import '../checkout_state.dart';

class PaymentMethodView extends StatefulWidget {
  final Function changeView;

  const PaymentMethodView({Key key, this.changeView}) : super(key: key);

  @override
  _PaymentMethodViewState createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  int paymentCardIndex = 0;

  TextEditingController _nameOnCardController;
  TextEditingController _cardNumberController;
  TextEditingController _expirationDateController;
  TextEditingController _cvvController;

  @override
  void initState() {
    _nameOnCardController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationDateController = TextEditingController();
    _cvvController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameOnCardController?.dispose();
    _cardNumberController?.dispose();
    _expirationDateController?.dispose();
    _cvvController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;

    return BlocListener(
        bloc: bloc,
        listener: (BuildContext context, CheckoutState state) {
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
              var currentCardId = 0;
              var showAddNewCardForm = false;
              if (state is CheckoutProceedState) {
                currentCardId = state.cardId;
                showAddNewCardForm = state.showAddNewCardForm;
              }

              return SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                    child: Column(children: <Widget>[
                      OpenFlutterBlockSubtitle(
                          width: width, title: 'Your payment cards'),
                      OpenFlutterPaymentCardPreview(
                        width: width,
                        cardNumber: '**** **** **** 3947',
                        cardHolderName: 'Jennyfer Doe',
                        expirationMonth: 5,
                        expirationYear: 23,
                      ),
                      OpenFlutterCheckbox(
                          width: width,
                          title: 'Use as default payment method',
                          checked: currentCardId == 1,
                          onTap: ((bool newValue) =>
                              {_changeDefaultPaymentCard(bloc, 1)})),
                      OpenFlutterPaymentCardPreview(
                          width: width,
                          cardNumber: '**** **** **** 4546',
                          cardHolderName: 'Jennyfer Doe',
                          expirationMonth: 11,
                          expirationYear: 22,
                          cardType: CardType.Visa),
                      OpenFlutterCheckbox(
                          width: width,
                          title: 'Use as default payment method',
                          checked: currentCardId == 2,
                          onTap: ((bool newValue) =>
                              {_changeDefaultPaymentCard(bloc, 2)})),
                    ])),
                Positioned(
                  bottom: AppSizes.sidePadding,
                  right: AppSizes.sidePadding,
                  child: FloatingActionButton(
                      mini: true,
                      backgroundColor: _theme.primaryColor,
                      onPressed: (() =>
                          {bloc..add(CheckoutShowAddNewCardEvent())}),
                      child: Icon(Icons.add, size: 36)),
                ),
                showAddNewCardForm
                    ? OpenFlutterBottomPopup(
                        title: 'Add new card',
                        //height: 550,
                        child: Column(
                          children: <Widget>[
                            OpenFlutterInputField(
                              controller: _nameOnCardController,
                              hint: 'Name on card',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.sidePadding),
                            ),
                            OpenFlutterInputField(
                              controller: _cardNumberController,
                              hint: 'Card number',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.sidePadding),
                            ),
                            OpenFlutterInputField(
                              controller: _expirationDateController,
                              hint: 'Expiration Date',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.sidePadding),
                            ),
                            OpenFlutterInputField(
                              controller: _cvvController,
                              hint: 'CVV',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.sidePadding),
                            ),
                            OpenFlutterCheckbox(
                                width: width,
                                title: 'Use as default payment method',
                                checked: false,
                                onTap: ((bool newValue) =>
                                    {_changeDefaultPaymentCard(bloc, 3)})),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: AppSizes.sidePadding),
                            ),
                            OpenFlutterButton(
                              title: 'ADD CARD',
                              onPressed: (() => {
                                    bloc
                                      ..add(CheckoutAddNewCardEvent(
                                          nameOnCard:
                                              _nameOnCardController.text,
                                          cardNumber:
                                              _cardNumberController.text,
                                          expirationMonth: int.parse(
                                              _expirationDateController.text
                                                  .split('/')[0]),
                                          expirationYear: int.parse(
                                              _expirationDateController.text
                                                  .split('/')[1]),
                                          cvv: int.parse(_cvvController.text)))
                                  }),
                            )
                          ],
                        ),
                      )
                    : Container()
              ]));
            }));
  }

  void _changeDefaultPaymentCard(CheckoutBloc bloc, int cardId) {
    bloc..add(CheckoutSetDefaultCardEvent(cardId));
    widget.changeView(changeType: ViewChangeType.Exact, index: 0);
    //TODO: implement change of default payment card
  }
}
