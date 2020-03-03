// Checkout Payment Method View Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-24

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../checkout.dart';
import '../checkout_bloc.dart';
import '../checkout_state.dart';

class AddShippingAddressView extends StatefulWidget {
  final Function changeView;

  const AddShippingAddressView({Key key, this.changeView}) : super(key: key);

  @override
  _AddShippingAddressViewState createState() => _AddShippingAddressViewState();
}

class _AddShippingAddressViewState extends State<AddShippingAddressView> {
  int paymentCardIndex = 0;

  TextEditingController _fullNameController;
  TextEditingController _addressController;
  TextEditingController _cityController;
  TextEditingController _stateController;
  TextEditingController _postalController;
  TextEditingController _countryController;

  @override
  void initState() {
    _fullNameController = new TextEditingController();
    _addressController = new TextEditingController();
    _cityController = new TextEditingController();
    _stateController = new TextEditingController();
    _postalController = new TextEditingController();
    _countryController = new TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _fullNameController?.dispose();
    _addressController?.dispose();
    _cityController?.dispose();
    _stateController?.dispose();
    _postalController?.dispose();
    _countryController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);
    final ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;

    return BlocListener(
        bloc: bloc,
        listener: (BuildContext context, CheckoutState state) {
          if (state is CheckoutErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text('An error occured',
                    style: _theme.textTheme.headline3
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        },
        child: BlocBuilder(
            bloc: bloc,
            builder: (BuildContext context, CheckoutState state) {
              int currentCardId = 0;
              bool showAddNewCardForm = false;
              if (state is CheckoutProceedState) {
                currentCardId = state.cardId;
                showAddNewCardForm = state.showAddNewCardForm;
              }

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _fullNameController,
                      hint: 'Full name',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _addressController,
                      hint: 'Address',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _cityController,
                      hint: 'City',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _stateController,
                      hint: 'State/Province/Region',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _postalController,
                      hint: 'Zip Code (Postal Code)',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterInputField(
                      controller: _countryController,
                      hint: 'Country',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                    ),
                    OpenFlutterButton(
                      title: 'SAVE ADDRESS',
                      onPressed: (() => {
                            bloc
                              ..add(CheckoutAddNewShippingAddressEvent(
                                  fullName: _fullNameController.text,
                                  address: _addressController.text,
                                  city: _cityController.text,
                                  state: _stateController.text,
                                  postal: _postalController.text,
                                  country: _countryController.text)),
                            widget.changeView(
                                changeType: ViewChangeType.Backward)
                          }),
                    )
                  ],
                ),
              );
            }));
  }

  _changeDefaultPaymentCard(CheckoutBloc bloc, int cardId) {
    bloc..add(CheckoutSetDefaultCardEvent(cardId));
    widget.changeView(changeType: ViewChangeType.Exact, index: 0);
    //TODO: implement change of default payment card
  }
}
