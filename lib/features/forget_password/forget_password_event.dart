import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgotPasswordPressed extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordPressed(this.email);

  @override
  List<Object> get props => [email];
}
