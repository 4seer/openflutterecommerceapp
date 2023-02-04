import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignUpEvent {
  final String email;
  final String password;
  final String name;

  SignUpPressed({required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpPressedFacebook extends SignUpEvent {}

class SignUpPressedGoogle extends SignUpEvent {}

