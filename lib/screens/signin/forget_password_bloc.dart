import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/screens/signin/signin.dart';

class ForgetPasswordBloc extends Bloc<SignInEvent, SignInState> {
  @override
  SignInState get initialState => InitialState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SendEmailPressed) {
      yield ProcessingState();
      await Future.delayed(
          Duration(milliseconds: 300)); //TODO use real auth service
      yield FinishedState();
    }
  }
}
