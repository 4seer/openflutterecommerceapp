import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/abstract/user_repository.dart';
import 'package:openflutterecommerce/presentation/features/authentication/authentication.dart';

import 'sign_in.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  SignInState get initialState => SignInInitialState();

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    // normal sign in
    if (event is SignInPressed) {
      yield SignInProcessingState();
      try {
        var token = await userRepository.signIn(
          email: event.email,
          password: event.password,
        );
        authenticationBloc.add(LoggedIn(token));
        yield SignInFinishedState();
      } catch (error) {
        yield SignInErrorState(error);
      }
    }

    // sign in with facebook
    if (event is SignInPressedFacebook) {
      yield SignInProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 300),
        ); //TODO use real auth service

        yield SignInFinishedState();
      } catch (error) {
        yield SignInErrorState(error);
      }
    }

    // sign in with google
    if (event is SignInPressedGoogle) {
      yield SignInProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 100),
        ); //TODO use real auth service

        yield SignInFinishedState();
      } catch (error) {
        yield SignInErrorState(error);
      }
    }
  }
}
