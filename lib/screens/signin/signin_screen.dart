import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/screens/signin/signup.dart';
import 'package:openflutterecommerce/screens/signin/views/right_arrow_action.dart';
import 'package:openflutterecommerce/screens/signin/views/service_button.dart';
import 'package:openflutterecommerce/screens/signin/views/sign_in_field.dart';
import 'package:openflutterecommerce/screens/signin/views/signin_button.dart';
import 'package:openflutterecommerce/screens/signin/views/title.dart';

import '../../config/routes.dart';
import '../../config/theme.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey();

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
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.9,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SignInTitle("Sign in"),
                SizedBox(
                  height: sizeBetween,
                ),
                SignInField(
                  controller: emailController,
                  hint: "Email",
                  validator: _validateEmail,
                  keyboard: TextInputType.emailAddress,
                ),
                SignInField(
                  controller: passwordController,
                  hint: "Password",
                  validator: _passwordCorrect,
                  keyboard: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                RightArrowAction(
                  "Forgot your password",
                  onClick: _showForgotPassword,
                ),
                SignInButton("LOGIN", onPressed: () {
                  if (formKey.currentState.validate()) {
                    BlocProvider.of<SignUpBloc>(context).add(SignInPressed(
                        email: emailController.text,
                        password: passwordController.text));
                  }
                }),
                SizedBox(
                  height: sizeBetween * 2,
                ),
                Center(
                  child: Text("Or sign up with social account"),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ServiceButton(
                          serviceType: ServiceType.Google,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context)
                                .add(SignUpWithGoogle());
                          },
                        ),
                        ServiceButton(
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
        ),
      ),
    );
  }

  String _valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field";
    } else {
      return null;
    }
  }

  String _passwordCorrect(dynamic value) {
    String emptyResult = _valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Your password must be at least 8 symbols with number, big and small letter and special character (!@#\$%^&*).';
      } else {
        return null;
      }
    } else {
      return emptyResult;
    }
  }

  String _validateEmail(dynamic value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    String emptyResult = _valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return "Not a valid email address. Should be your@email.com";
    } else {
      return null;
    }
  }

  void _showForgotPassword() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.FORGET_PASSWORD);
  }
}
