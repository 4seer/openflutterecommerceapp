import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/domain/entities/validator.dart';
import 'package:openflutterecommerce/presentation/features/sign_up/sign_up.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'forget_password.dart';


class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<OpenFlutterInputFieldState> emailKey = GlobalKey();

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
      body: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          // on success push back
          if (state is ForgetPasswordFinishedState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('An email with password reminder was sent to ${state.email}'),
                backgroundColor: Colors.green, // TODO use app colors
                duration: Duration(seconds: 3),
              ),
            );
          }
          // on failure show a snackbar
          if (state is ForgetPasswordErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red, // TODO use app colors
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          // show loading screen while processing
          if (state is ForgetPasswordProcessingState) {
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                        'Please enter your email address. You will receive a link to create a new password via email'),
                  ),
                  OpenFlutterInputField(
                    key: emailKey,
                    controller: emailController,
                    hint: 'Email',
                    validator: Validator.validateEmail,
                    keyboard: TextInputType.emailAddress,
                  ),
                  OpenFlutterRightArrow(
                    'Already have an account',
                    onClick: _showSignUpScreen,
                  ),
                  OpenFlutterButton(title: 'SEND', onPressed: _validateAndSend),
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

  void _showSignUpScreen() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.signup);
  }

  void _validateAndSend() {
    if (emailKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<ForgetPasswordBloc>(context).add(
      ForgetPasswordPressed(
        emailController.text,
      ),
    );
  }
}
