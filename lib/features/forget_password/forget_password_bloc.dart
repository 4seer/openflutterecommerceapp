import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  @override
  ForgetPasswordState get initialState => ForgetPasswordInitialState();

  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
  ) async* {
    if (event is ForgetPasswordPressed) {
      yield ForgetPasswordProcessingState();
      try {
        await Future.delayed(
          Duration(milliseconds: 300),
        ); //TODO use real auth service

        yield ForgetPasswordFinishedState();
      } catch (error) {
        yield ForgetPasswordErrorState(error);
      }
    }
  }
}
