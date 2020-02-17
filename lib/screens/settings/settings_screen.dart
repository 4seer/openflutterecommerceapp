import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifySales = true;
  bool _notifyArrivals = false;
  bool _notifyDelivery = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.background,
      body: Container(
        height: height * 0.9,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Settings',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 21,
              ),
              OpenFlutterInputField(
                hint: 'Full Name',
              ),
              SizedBox(
                height: 24,
              ),
              OpenFlutterInputField(
                hint: 'Date of Birth',
              ),
              SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showChangePasswordBottomSheet(context);
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              OpenFlutterInputField(
                hint: 'Password',
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Notifications',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sales',
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                  CupertinoSwitch(
                    trackColor: AppColors.lightGray,
                    value: _notifySales,
                    activeColor: AppColors.success,
                    onChanged: (newValue) {
                      setState(() {
                        _notifySales = newValue;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New arrivals',
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                  CupertinoSwitch(
                    trackColor: AppColors.lightGray,
                    value: _notifyArrivals,
                    activeColor: AppColors.success,
                    onChanged: (newValue) {
                      setState(() {
                        _notifyArrivals = newValue;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Delivery status changes',
                    style: TextStyle(fontSize: 14, color: AppColors.black),
                  ),
                  CupertinoSwitch(
                    trackColor: AppColors.lightGray,
                    value: _notifyDelivery,
                    activeColor: AppColors.success,
                    onChanged: (newValue) {
                      setState(() {
                        _notifyDelivery = newValue;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showChangePasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        builder: (BuildContext context) => Container(
              height: 472,
              padding: AppSizes.bottomSheetPadding,
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                  boxShadow: []),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 6,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Password Change',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  OpenFlutterInputField(
                    hint: 'Old Password',
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.lightGray),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  OpenFlutterInputField(
                    hint: 'New Password',
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  OpenFlutterInputField(
                    hint: 'Repeat New Password',
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  OpenFlutterButton(
                    title: 'Save Password',
                    height: 48,
                    onPressed: () {},
                  )
                ],
              ),
            ));
  }
}
