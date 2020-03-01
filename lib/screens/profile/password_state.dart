import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialPasswordState extends PasswordState {}

class IncorrectCurrentPasswordState extends PasswordState {}

class EmptyCurrentPasswordState extends PasswordState {}

class EmptyNewPasswordState extends PasswordState {}

class EmptyRepeatPasswordState extends PasswordState {}

class PasswordMismatchState extends PasswordState {}

class InvalidNewPasswordState extends PasswordState {}

class PasswordChangedState extends PasswordState {}

class ChangePasswordErrorState extends PasswordState {
  final String errorMessage;

  ChangePasswordErrorState({this.errorMessage}) : super();

  @override
  List<Object> get props => [this.errorMessage];
}
