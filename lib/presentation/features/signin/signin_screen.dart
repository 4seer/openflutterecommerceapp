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
      body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
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
                OpenFlutterButton(title: 'LOGIN', onPressed: _validateAndSend),
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
                            BlocProvider.of<SignUpBloc>(context)
                                .add(LoginWithGoogle());
                          },
                        ),
                        OpenFlutterServiceButton(
                          serviceType: ServiceType.Facebook,
                          onPressed: () {
                            BlocProvider.of<SignInBloc>(context)
                                .add(LoginWithFB());
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
    Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.forgotPassword);
  }

  void _validateAndSend() {
    if (emailKey.currentState.validate() != null) {
      return;
    }
    if (passwordKey.currentState.validate() != null) {
      return;
    }
    BlocProvider.of<SignInBloc>(context).add(SignInPressed(
        email: emailController.text, password: passwordController.text));

    BlocProvider.of<AuthenticationBloc>(context)
        .add(LoggedIn(AppUser(emailController.text, passwordController.text)));
  }
}
