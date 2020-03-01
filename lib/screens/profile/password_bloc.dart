import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/password_repository.dart';
import 'package:openflutterecommerce/screens/profile/password_event.dart';
import 'package:openflutterecommerce/screens/profile/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordRepository passwordRepository = PasswordRepository();

  @override
  PasswordState get initialState => InitialPasswordState();

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is ChangePasswordEvent) {
      if (event.currentPassword.length == 0) {
        yield EmptyCurrentPasswordState();
      } else if (event.newPassword.length == 0) {
        yield EmptyNewPasswordState();
      } else if (event.repeatNewPassword.length == 0) {
        yield EmptyRepeatPasswordState();
      } else if (event.newPassword != event.repeatNewPassword) {
        yield PasswordMismatchState();
      } else if (event.newPassword.length < 6) {
        yield InvalidNewPasswordState();
      } else {
        try {
          String currentPassword =
              await passwordRepository.getCurrentPassword();
          if (event.currentPassword != currentPassword) {
            yield IncorrectCurrentPasswordState();
          } else {
            try {
              await passwordRepository.changePassword(event.newPassword);
              yield PasswordChangedState();
            } catch (error) {
              yield ChangePasswordErrorState(errorMessage: error.toString());
            }
          }
        } catch (error) {
          yield ChangePasswordErrorState(errorMessage: error.toString());
        }
      }
    }
  }
}
