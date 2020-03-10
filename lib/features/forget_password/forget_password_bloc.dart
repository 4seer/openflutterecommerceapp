import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password.dart';

class ForgetPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  @override
  ForgotPasswordState get initialState => ForgotPasswordInitialState();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordPressed) {
      yield ForgotPasswordProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 300),
        ); //TODO use real auth service

        yield ForgotPasswordFinishedState();
      } catch (error) {
        yield ForgotPasswordErrorState(error);
      }
    }
  }
}
