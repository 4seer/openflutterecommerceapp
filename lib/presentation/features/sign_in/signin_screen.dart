import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/domain/entities/validator.dart';
import 'package:openflutterecommerce/presentation/features/sign_up/sign_up.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'sign_in.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<OpenFlutterInputFieldState> emailKey = GlobalKey();
  final GlobalKey<OpenFlutterInputFieldState> passwordKey = GlobalKey();

  double sizeBetween;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.background,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is SignInFinishedState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              OpenFlutterEcommerceRoutes.home,
              (Route<dynamic> route) => false,
            );
          }
          // on failure show a snackbar
          if (state is SignInErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          // show loading screen while processing
          if (state is SignInProcessingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              height: height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OpenFlutterBlockHeader(title: 'Sign in', width: width),
                  SizedBox(
                    height: sizeBetween,
                  ),
                  OpenFlutterInputField(
                    key: emailKey,
                    controller: emailController,
                    hint: 'Email',
                    validator: Validator.validateEmail,
                    keyboard: TextInputType.emailAddress,
                  ),
                  OpenFlutterInputField(
                    key: passwordKey,
                    controller: passwordController,
                    hint: 'Password',
                    validator: Validator.passwordCorrect,
                    keyboard: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  OpenFlutterRightArrow(
                    'Forgot your password',
                    onClick: _showForgotPassword,
                  ),
                  OpenFlutterButton(
                      title: 'LOGIN', onPressed: _validateAndSend),
                  SizedBox(
                    height: sizeBetween * 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                    child: Center(
                      child: Text('Or sign up with social account'),
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
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpPressedGoogle(),
                            );
                          },
                        ),
                        OpenFlutterServiceButton(
                          serviceType: ServiceType.Facebook,
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpPressedFacebook(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showForgotPassword() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.forgotPassword);
  }

  void _validateAndSend() {
    if (emailKey.currentState.validate() != null) {
      return;
    }
    if (passwordKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignInBloc>(context).add(
      SignInPressed(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
