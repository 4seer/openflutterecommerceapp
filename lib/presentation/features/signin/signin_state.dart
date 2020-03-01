import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends SignInState {}

class ProcessingState extends SignInState {}

class ErrorState extends SignInState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class FinishedState extends SignInState {}
