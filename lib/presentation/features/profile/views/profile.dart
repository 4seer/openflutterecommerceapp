import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/wrapper.dart';
import 'package:openflutterecommerce/presentation/widgets/menu_line.dart';

import '../profile.dart';

class ProfileView extends StatefulWidget {
  final Function changeView;

  const ProfileView({Key key, this.changeView}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    ProfileBloc bloc = BlocProvider.of<ProfileBloc>(context);
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10.0),
              child: Container(
                  child: Text(
                "My profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.0),
              )),
            ),
            SizedBox(
              height: 5.0,
            ),
            ListTile(
              leading: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/profile/user-profile.jpeg"))),
              ),
              title: Text(
                //TODO: take from profile info
                "Matilda Brown",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                //TODO: take from profile info
                "matildabrown@mail.com",
                style: TextStyle(
                    color: AppColors.lightGray, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            OpenFlutterMenuLine(
                title: "My orders",
                //TODO: make short card info
                subtitle: "Already Have 12 orders",
                onTap: (() => {
                      bloc..add(ProfileMyOrdersEvent()),
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 1)
                    })),
            Divider(),
            OpenFlutterMenuLine(
                title: "Shipping addresses",
                //TODO: make dynamic address count
                subtitle: "3 addresses",
                onTap: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 2)
                    })),
            Divider(),
            OpenFlutterMenuLine(
                title: "Payments methods",
                //TODO: make short card info
                subtitle: "visa **34",
                onTap: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 3)
                    })),
            Divider(),
            OpenFlutterMenuLine(
                title: "Promocodes",
                //TODO: make dynamic later
                subtitle: "You have special promocodes",
                onTap: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 4)
                    })),
            Divider(),
            OpenFlutterMenuLine(
                title: "My reviews",
                //TODO: make dynamic later
                subtitle: "review for 4 items",
                onTap: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 5)
                    })),
            Divider(),
            OpenFlutterMenuLine(
                title: "Settings",
                subtitle: "Notification, Password",
                onTap: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 6)
                      //Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.settings)
                    }))
          ],
        )
      ],
    );
  }
}
