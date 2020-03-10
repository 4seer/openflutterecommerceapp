import 'package:equatable/equatable.dart';

abstract class ForgotPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordProcessingState extends ForgotPasswordState {}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String error;

  ForgotPasswordErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ForgotPasswordFinishedState extends ForgotPasswordState {}
