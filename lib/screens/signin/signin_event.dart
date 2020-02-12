import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignInEvent {
  final String email;
  final String password;
  final String name;

  SignUpPressed({this.name, this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class SignInPressed extends SignInEvent {
  final String email;
  final String password;

  SignInPressed({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithFB extends SignInEvent {}

class LoginWithGoogle extends SignInEvent {}

class SignUpWithFB extends SignInEvent {}

class SignUpWithGoogle extends SignInEvent {}

class SendEmailPressed extends SignInEvent {
  final String email;

  SendEmailPressed(this.email);

  @override
  List<Object> get props => [email];
}
