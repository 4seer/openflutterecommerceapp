import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/abstract/user_repository.dart';
import 'package:openflutterecommerce/presentation/features/authentication/authentication.dart';

import 'sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  SignUpState get initialState => SignUpInitialState();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // normal sign up
    if (event is SignUpPressed) {
      yield SignUpProcessingState();
      try {
        final token = await userRepository.signUp(
          name: event.name,
          email: event.email,
          password: event.password,
        );
        authenticationBloc.add(LoggedIn(token));
        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error);
      }
    }

    // sign up with facebook
    if (event is SignUpPressedFacebook) {
      yield SignUpProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 300),
        ); //TODO use real auth service

        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error);
      }
    }

    //sign up with google
    if (event is SignUpPressedGoogle) {
      yield SignUpProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 100),
        ); //TODO use real auth service

        yield SignUpFinishedState();
      } catch (error) {
        yield SignUpErrorState(error);
      }
    }
  }
}
