import 'package:equatable/equatable.dart';

abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordProcessingState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String error;

  ForgetPasswordErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ForgetPasswordFinishedState extends ForgetPasswordState {}
