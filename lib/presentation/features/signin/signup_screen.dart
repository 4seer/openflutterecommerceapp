import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/app_user.dart';
import 'package:openflutterecommerce/presentation/features/authentication/authentication.dart';
import 'package:openflutterecommerce/presentation/features/signin/signin.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'signup.dart';
import 'validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<OpenFlutterInputFieldState> emailKey = GlobalKey();
  final GlobalKey<OpenFlutterInputFieldState> passwordKey = GlobalKey();
  final GlobalKey<OpenFlutterInputFieldState> nameKey = GlobalKey();

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
      body: BlocConsumer<SignUpBloc, SignInState>(listener: (context, state) {
        if (state is FinishedState) Navigator.of(context).pop();
      }, builder: (context, state) {
        if (state is ProcessingState) {
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
                OpenFlutterBlockHeader(title: 'Sign up', width: width),
                SizedBox(
                  height: sizeBetween,
                ),
                OpenFlutterInputField(
                  key: nameKey,
                  controller: nameController,
                  hint: 'Name',
                  validator: Validator.valueExists,
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
                  'Already have an account',
                  onClick: _showSignInScreen,
                ),
                OpenFlutterButton(
                    title: 'SIGN UP', onPressed: _validateAndSend),
                SizedBox(
                  height: sizeBetween,
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
      }),
    );
  }

  void _showSignInScreen() {
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.signin);
  }

  void _validateAndSend() {
    if (nameKey.currentState.validate() != null) {
      return;
    }
    if (emailKey.currentState.validate() != null) {
      return;
    }
    if (passwordKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignUpBloc>(context).add(SignUpPressed(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text));

    BlocProvider.of<AuthenticationBloc>(context)
        .add(LoggedIn(AppUser(emailController.text, passwordController.text)));
  }
}
