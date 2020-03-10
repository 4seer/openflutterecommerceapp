import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/user_repository.dart';
import 'package:openflutterecommerce/screens/cart/cart_screen.dart';
import 'package:openflutterecommerce/screens/categories/categories_screen.dart';
import 'package:openflutterecommerce/screens/favorites/favorites.dart';
import 'package:openflutterecommerce/screens/home/home_screen.dart';

import 'package:openflutterecommerce/screens/profile/profile_screen.dart';
import 'package:openflutterecommerce/screens/signin/forget_password_screen.dart';
import 'package:openflutterecommerce/screens/splash_screen.dart';

import 'features/authentication/authentication.dart';
import 'config/routes.dart';
import 'features/forget_password/forget_password.dart';
import 'features/sign_up/sign_up.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/home/home_screen.dart';
import 'features/sign_in/sign_in.dart';
import 'screens/signin/signin_screen.dart';
import 'screens/signin/signup_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() async {
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'de', 'fr'],
  );

  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  AuthenticationBloc _authenticationBloc = AuthenticationBloc();
  UserRepository _userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => _authenticationBloc..add(AppStarted()),
      child: LocalizedApp(
        delegate,
        OpenFlutterEcommerceApp(
          authenticationBloc: _authenticationBloc,
          userRepository: _userRepository,
        ),
      ),
    ),
  );
}

class OpenFlutterEcommerceApp extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;
  final UserRepository userRepository;

  const OpenFlutterEcommerceApp(
      {Key key, this.authenticationBloc, this.userRepository})
      : super(key: key);

  get _signIn => BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
          authenticationBloc: authenticationBloc,
          userRepository: userRepository,
        ),
        child: SignInScreen(),
      );

  get _signUp => BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          authenticationBloc: authenticationBloc,
          userRepository: userRepository,
        ),
        child: SignUpScreen(),
      );

  get _forgetPassword => BlocProvider<ForgetPasswordBloc>(
        create: (context) => ForgetPasswordBloc(),
        child: ForgetPasswordScreen(),
      );

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: localizationDelegate.currentLocale,
        title: 'Open FLutter E-commerce',
        theme: OpenFlutterEcommerceTheme.of(context),
        routes: <String, WidgetBuilder>{
          OpenFlutterEcommerceRoutes.home: (context) => HomeScreen(),
          OpenFlutterEcommerceRoutes.cart: (context) => CartScreen(),
          OpenFlutterEcommerceRoutes.checkout: (context) => CheckoutScreen(),
          OpenFlutterEcommerceRoutes.favourites: (context) => FavouriteScreen(),
          OpenFlutterEcommerceRoutes.signin: (context) => _signIn,
          OpenFlutterEcommerceRoutes.signup: (context) => _signUp,
          OpenFlutterEcommerceRoutes.forgotPassword: (context) =>
              _forgetPassword,
          OpenFlutterEcommerceRoutes.shop: (context) => CategoriesScreen(),
          OpenFlutterEcommerceRoutes.profile: (context) =>
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return ProfileScreen(); //TODO profile properties should be here
                  } else if (state is Unauthenticated) {
                    return _signUp;
                  } else {
                    return SplashScreen();
                  }
                },
              ),
        },
      ),
    );
  }
}
