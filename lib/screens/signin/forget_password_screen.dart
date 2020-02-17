import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/screens/signin/forget_password.dart';
import 'package:openflutterecommerce/screens/signin/signup.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

import '../../config/routes.dart';
import '../../config/theme.dart';
import 'validator.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = new TextEditingController();
  final GlobalKey<OpenFlutterInputFieldState> emailKey = new GlobalKey();

  double sizeBetween;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.background,
      body: BlocConsumer<ForgetPasswordBloc, SignInState>(
        listener: (context, state) {
          if (state is FinishedState) Navigator.of(context).pop();
        },
        builder: (context, state) {
          if (state is ProcessingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          return SingleChildScrollView(
            child: Container(
              height: height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OpenFlutterBlockHeader(title: "Sign in", width: width),
                  SizedBox(
                    height: sizeBetween,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                        "Please enter your email address. You will receive a link to create a new password via email"),
                  ),
                  OpenFlutterInputField(
                    key: emailKey,
                    controller: emailController,
                    hint: "Email",
                    validator: Validator.validateEmail,
                    keyboard: TextInputType.emailAddress,
                  ),
                  OpenFlutterRightArrow(
                    "Already have an account",
                    onClick: _showSignInScreen,
                  ),
                  OpenFlutterButton(title: "SEND", onPressed: _validateAndSend),
                  SizedBox(
                    height: sizeBetween * 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                    child: Center(
                      child: Text("Or sign up with social account"),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          OpenFlutterServiceButton(
                            serviceType: ServiceType.Google,
                            onPressed: () {
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(SignUpWithGoogle());
                            },
                          ),
                          OpenFlutterServiceButton(
                            serviceType: ServiceType.Facebook,
                            onPressed: () {
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(SignUpWithFB());
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSignInScreen() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.signin);
  }

  void _validateAndSend() {
    if (emailKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignUpBloc>(context).add(SendEmailPressed(
      emailController.text,
    ));
  }
}
