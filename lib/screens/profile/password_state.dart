import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class PasswordInitialState extends PasswordState {}

@immutable
class IncorrectCurrentPasswordState extends PasswordState {}

@immutable
class EmptyCurrentPasswordState extends PasswordState {}

@immutable
class EmptyNewPasswordState extends PasswordState {}

@immutable
class EmptyRepeatPasswordState extends PasswordState {}

@immutable
class PasswordMismatchState extends PasswordState {}

@immutable
class InvalidNewPasswordState extends PasswordState {}

@immutable
class PasswordChangedState extends PasswordState {}

@immutable
class ChangePasswordErrorState extends PasswordState {
  final String errorMessage;

  ChangePasswordErrorState({this.errorMessage}) : super();

  @override
  List<Object> get props => [this.errorMessage];
}
