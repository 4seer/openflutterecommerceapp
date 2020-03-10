import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/repos/models/app_user.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final AppUser user;

  LoggedIn(this.user);

  @override
  List<Object> get props => [user.email];
}

class LoggedOut extends AuthenticationEvent {}
