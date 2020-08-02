import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/abstract/user_repository.dart';

import 'forget_password.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final UserRepository userRepository;

  ForgetPasswordBloc({@required this.userRepository});

  @override
  ForgetPasswordState get initialState => ForgetPasswordInitialState();

  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
  ) async* {
    if (event is ForgetPasswordPressed) {
      yield ForgetPasswordProcessingState();
      try {
        await userRepository.forgotPassword(
          email: event.email.toString(),
        );
        yield ForgetPasswordFinishedState(event.email);
      } catch (error) {
        yield ForgetPasswordErrorState(error);
      }
    }
  }
}
