import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/screens/checkout/views/shipping_address_view.dart';
import 'package:openflutterecommerce/screens/profile/profile_bloc.dart';
import 'package:openflutterecommerce/screens/profile/profile_event.dart';
import 'package:openflutterecommerce/screens/profile/profile_state.dart';
import 'package:openflutterecommerce/screens/profile/views/orders.dart';
import 'package:openflutterecommerce/screens/profile/views/payment_methods.dart';
import 'package:openflutterecommerce/screens/profile/views/profile.dart';
import 'package:openflutterecommerce/screens/profile/views/promos.dart';
import 'package:openflutterecommerce/screens/profile/views/reviews.dart';
import 'package:openflutterecommerce/screens/profile/views/shipping_addresses.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

import '../wrapper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OpenFlutterScaffold(
        body: BlocProvider<ProfileBloc>(
          create: (context) {
            return ProfileBloc(
            )
              ..add(ProfileStartEvent());
          },
          child: ProfileWrapper()),
        bottomMenuIndex: 4,
      ),
    );
  }
}

class ProfileWrapper extends StatefulWidget {
  @override
  _ProfileWrapperState createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends OpenFlutterWrapperState<ProfileWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: BlocProvider.of<ProfileBloc>(context),
      builder: (BuildContext context, ProfileState state) {
        return getPageView(<Widget>[
            ProfileView(changeView: changePage),
            MyOrdersView(changeView: changePage),
            MyShippingAddressesView(changeView: changePage),
            PaymentMethodsView(changeView: changePage),
            PromosView(changeView: changePage),
            MyReviewsView(changeView: changePage),
          ]);
      });
  }
}
