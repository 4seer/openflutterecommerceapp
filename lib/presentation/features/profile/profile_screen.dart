import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../wrapper.dart';
import 'profile.dart';
import 'profile_bloc.dart';
import 'views/order_details.dart';
import 'views/orders.dart';
import 'views/payment_methods.dart';
import 'views/promos.dart';
import 'views/reviews.dart';
import 'views/settings.dart';
import 'views/shipping_addresses.dart';

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
        title: 'My Profile',
        body: BlocProvider<ProfileBloc>(
            create: (context) {
              return ProfileBloc()..add(ProfileStartEvent());
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
            SettingsView(changeView: changePage),
            MyOrderDetailsView(changeView: changePage),
          ]);
        });
  }
}
