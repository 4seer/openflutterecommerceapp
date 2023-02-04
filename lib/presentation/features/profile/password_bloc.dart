import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/password_repository.dart';
import 'package:openflutterecommerce/presentation/features/profile/password_event.dart';
import 'package:openflutterecommerce/presentation/features/profile/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final PasswordRepository passwordRepository;

  PasswordBloc({required this.passwordRepository})
      : assert(passwordRepository != null),
        super(PasswordInitialState());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is ChangePasswordEvent) {
      if (event.currentPassword.isEmpty) {
        yield EmptyCurrentPasswordState();
      } else if (event.newPassword.isEmpty) {
        yield EmptyNewPasswordState();
      } else if (event.repeatNewPassword.isEmpty) {
        yield EmptyRepeatPasswordState();
      } else if (event.newPassword != event.repeatNewPassword) {
        yield PasswordMismatchState();
      } else if (event.newPassword.length < 6) {
        yield InvalidNewPasswordState();
      } else {
        try {
          var currentPassword = await passwordRepository.getCurrentPassword();
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
