import 'package:equatable/equatable.dart';

class PasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class IncorrectCurrentPasswordState extends PasswordState {
  final String currentPassword;
  final String newPassword;
  final String repeatNewPassword;

  IncorrectCurrentPasswordState(
      {this.currentPassword, this.newPassword, this.repeatNewPassword});

  @override
  List<Object> get props =>
      [this.currentPassword, this.newPassword, this.repeatNewPassword];
}

class PasswordMismatchState extends PasswordState {
  final String currentPassword;
  final String newPassword;
  final String repeatNewPassword;

  PasswordMismatchState(
      {this.currentPassword, this.newPassword, this.repeatNewPassword});

  @override
  List<Object> get props =>
      [this.currentPassword, this.newPassword, this.repeatNewPassword];
}

class InvalidNewPasswordState extends PasswordState {
  final String currentPassword;
  final String newPassword;
  final String repeatNewPassword;

  InvalidNewPasswordState(
      {this.currentPassword, this.newPassword, this.repeatNewPassword});

  @override
  List<Object> get props =>
      [this.currentPassword, this.newPassword, this.repeatNewPassword];
}

class PasswordChangedState extends PasswordState {}
