import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/password_repository.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/settings_repository.dart';
import 'package:openflutterecommerce/presentation/features/profile/password_bloc.dart';
import 'package:openflutterecommerce/presentation/features/profile/password_event.dart';
import 'package:openflutterecommerce/presentation/features/profile/password_state.dart';
import 'package:openflutterecommerce/presentation/features/profile/settings_bloc.dart';
import 'package:openflutterecommerce/presentation/features/profile/settings_event.dart';
import 'package:openflutterecommerce/presentation/features/profile/settings_state.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class SettingsView extends StatefulWidget {
  final Function? changeView;

  const SettingsView({ this.changeView}) ;

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _repeatPasswordController;
  late TextEditingController _fullNameController;
  late TextEditingController _dateOfBirthController;

  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController?.dispose();
    _newPasswordController?.dispose();
    _repeatPasswordController?.dispose();
    _fullNameController?.dispose();
    _dateOfBirthController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc(settingsRepository: SettingsRepository());

    return BlocProvider<SettingsBloc>(
      create: (context) => settingsBloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
          bloc: settingsBloc,
          builder: (context, state) {
            _fullNameController.text = state.settings!.fullName;
            _dateOfBirthController.text = state.settings!.dateOfBirth;

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
                        settingsBloc..add(UpdateFullNameEvent(fullName: value.toString().trim())),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  OpenFlutterInputField(
                    controller: _dateOfBirthController,
                    hint: 'Date of Birth',
                    horizontalPadding: 0,
                    onValueChanged: (value) =>
                        settingsBloc.add(UpdateDateOfBirthEvent(dateOfBirth: value.toString().trim())),
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
                          style: TextStyle(fontSize: 14, color: AppColors.lightGray, fontWeight: FontWeight.w500),
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
                        //trackColor: AppColors.lightGray,
                        value: state.settings!.notifySales,
                        activeColor: AppColors.success,
                        onChanged: (newValue) => settingsBloc.add(UpdateNotifySalesEvent(notifySales: newValue)),
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
                        //trackColor: AppColors.lightGray,
                        value: state.settings!.notifyArrivals,
                        activeColor: AppColors.success,
                        onChanged: (newValue) => settingsBloc..add(UpdateNotifyArrivalsEvent(notifyArrivals: newValue)),
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
                        //trackColor: AppColors.lightGray,
                        value: state.settings!.notifyDelivery,
                        activeColor: AppColors.success,
                        onChanged: (newValue) => settingsBloc..add(UpdateNotifyDeliveryEvent(notifyDelivery: newValue)),
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

  void _showChangePasswordBottomSheet(BuildContext context) {
    var passwordBloc = PasswordBloc(passwordRepository: PasswordRepository());

    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        builder: (BuildContext context) => BlocProvider<PasswordBloc>(
              create: (context) => passwordBloc,
              child: BlocBuilder<PasswordBloc, PasswordState>(
                  bloc: passwordBloc,
                  builder: (context, state) {
                    if (state is PasswordChangedState) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        // close bottom sheet
                        Navigator.pop(context);

                        _showAlertDialog(context, 'Success', 'Password changed successfully');

                        clearPasswordFields();
                      });
                    } else if (state is ChangePasswordErrorState) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _showAlertDialog(context, 'Error', state.errorMessage!);
                      });
                    }

                    return Container(
                      height: 472,
                      padding: AppSizes.bottomSheetPadding,
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(34), topRight: Radius.circular(34)),
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
                              style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            OpenFlutterInputField(
                              controller: _currentPasswordController,
                              hint: 'Old Password',
                              error: state is EmptyCurrentPasswordState
                                  ? 'field cannot be empty'
                                  : state is IncorrectCurrentPasswordState
                                      ? 'incorrect current password'
                                      : null,
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
                              error: state is EmptyNewPasswordState
                                  ? 'field cannot be empty'
                                  : state is InvalidNewPasswordState
                                      ? 'password should be at least 6 characters'
                                      : null,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            OpenFlutterInputField(
                              controller: _repeatPasswordController,
                              hint: 'Repeat New Password',
                              error: state is EmptyRepeatPasswordState
                                  ? 'field cannot be empty'
                                  : state is PasswordMismatchState
                                      ? 'password mismatch'
                                      : null,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            OpenFlutterButton(
                                title: 'Save Password',
                                height: 48,
                                onPressed: () => passwordBloc
                                  ..add(ChangePasswordEvent(
                                      currentPassword: _currentPasswordController.text.trim(),
                                      newPassword: _newPasswordController.text.trim(),
                                      repeatNewPassword: _repeatPasswordController.text.trim())))
                          ],
                        ),
                      ),
                    );
                  }),
            ));
  }

  Future<void> _showAlertDialog(BuildContext context, String title, String content) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void clearPasswordFields() {
    _currentPasswordController.text = '';
    _newPasswordController.text = '';
    _repeatPasswordController.text = '';
  }
}
