import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/presentation/features/signin/signin.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  @override
  SignInState get initialState => InitialState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInPressed) {
      yield ProcessingState();
      await Future.delayed(
          Duration(milliseconds: 300)); //TODO use real auth service
      yield FinishedState();
    } else if (event is LoginWithFB) {
      yield ProcessingState();
      await Future.delayed(
          Duration(milliseconds: 300)); //TODO use real auth service
      yield ErrorState("an error");
    } else if (event is LoginWithGoogle) {
      yield ProcessingState();
      await Future.delayed(
          Duration(milliseconds: 100)); //TODO use real auth service
      yield FinishedState();
    }
  }
}
