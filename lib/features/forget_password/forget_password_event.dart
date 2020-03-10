import 'package:equatable/equatable.dart';

abstract class ForgetPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgetPasswordPressed extends ForgetPasswordEvent {
  final String email;

  ForgetPasswordPressed(this.email);

  @override
  List<Object> get props => [email];
}
