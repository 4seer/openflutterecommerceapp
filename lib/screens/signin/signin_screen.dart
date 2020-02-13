import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/screens/signin/signin.dart';
import 'package:openflutterecommerce/screens/signin/signup.dart';
import 'package:openflutterecommerce/screens/signin/views/right_arrow_action.dart';
import 'package:openflutterecommerce/screens/signin/views/service_button.dart';
import 'package:openflutterecommerce/screens/signin/views/sign_in_field.dart';
import 'package:openflutterecommerce/screens/signin/views/signin_button.dart';
import 'package:openflutterecommerce/screens/signin/views/title.dart';

import '../../config/routes.dart';
import '../../config/theme.dart';
import 'validator.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final GlobalKey<SignInFieldState> emailKey = new GlobalKey();
  final GlobalKey<SignInFieldState> passwordKey = new GlobalKey();

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
      body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
        if (state is FinishedState) Navigator.of(context).pop();
      }, builder: (context, state) {
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
                SignInTitle("Sign in"),
                SizedBox(
                  height: sizeBetween,
                ),
                SignInField(
                  key: emailKey,
                  controller: emailController,
                  hint: "Email",
                  validator: Validator.validateEmail,
                  keyboard: TextInputType.emailAddress,
                ),
                SignInField(
                  key: passwordKey,
                  controller: passwordController,
                  hint: "Password",
                  validator: Validator.passwordCorrect,
                  keyboard: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                RightArrowAction(
                  "Forgot your password",
                  onClick: _showForgotPassword,
                ),
                SignInButton("LOGIN", onPressed: _validateAndSend),
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
        );
      }),
    );
  }

  void _showForgotPassword() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.FORGET_PASSWORD);
  }

  void _validateAndSend() {
    if (emailKey.currentState.validate() != null) {
      return;
    }
    if (passwordKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignUpBloc>(context).add(SignInPressed(
        email: emailController.text, password: passwordController.text));
  }
}
