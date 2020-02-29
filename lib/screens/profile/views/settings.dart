import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/screens/profile/settings_bloc.dart';
import 'package:openflutterecommerce/screens/profile/settings_event.dart';
import 'package:openflutterecommerce/screens/profile/settings_state.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class SettingsView extends StatefulWidget {
  final Function changeView;

  const SettingsView({Key key, this.changeView}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _oldPasswordController;
  TextEditingController _newPasswordController;
  TextEditingController _confirmPasswordController;
  TextEditingController _fullNameController;
  TextEditingController _dateOfBirthController;

  @override
  void initState() {
    _oldPasswordController = new TextEditingController();
    _newPasswordController = new TextEditingController();
    _confirmPasswordController = new TextEditingController();
    _fullNameController = new TextEditingController();
    _dateOfBirthController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController?.dispose();
    _newPasswordController?.dispose();
    _confirmPasswordController?.dispose();
    _fullNameController?.dispose();
    _dateOfBirthController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final settingsBloc = SettingsBloc();

    return BlocProvider<SettingsBloc>(
      create: (context) => settingsBloc,
      child:
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        _fullNameController.text = state.settings.fullName;
        _dateOfBirthController.text = state.settings.dateOfBirth;

        return SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(AppSizes.sidePadding),
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
                controller: _fullNameController,
                hint: 'Full Name',
                horizontalPadding: 0,
                onValueChanged: (value) =>
                    settingsBloc.add(UpdateFullNameEvent(fullName: value)),
              ),
              SizedBox(
                height: 24,
              ),
              OpenFlutterInputField(
                controller: _dateOfBirthController,
                hint: 'Date of Birth',
                horizontalPadding: 0,
                onValueChanged: (value) => settingsBloc
                    .add(UpdateDateOfBirthEvent(dateOfBirth: value)),
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
                    value: state.settings.notifySales,
                    activeColor: AppColors.success,
                    onChanged: (newValue) =>
                        settingsBloc.add(UpdateNotifySalesEvent()),
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
                    value: state.settings.notifyArrivals,
                    activeColor: AppColors.success,
                    onChanged: (newValue) =>
                        settingsBloc.add(UpdateNotifyArrivalsEvent()),
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
                    value: state.settings.notifyDelivery,
                    activeColor: AppColors.success,
                    onChanged: (newValue) =>
                        settingsBloc.add(UpdateNotifyDeliveryEvent()),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
      }),
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
              child: SingleChildScrollView(
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
                      controller: _oldPasswordController,
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
                      controller: _newPasswordController,
                      hint: 'New Password',
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    OpenFlutterInputField(
                      controller: _confirmPasswordController,
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
              ),
            ));
  }
}
