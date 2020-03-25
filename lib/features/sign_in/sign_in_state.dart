import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInProcessingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class SignInFinishedState extends SignInState {}
