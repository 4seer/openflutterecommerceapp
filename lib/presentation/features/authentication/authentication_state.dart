import 'package:equatable/equatable.dart';
import 'package:openflutterecommerce/data/abstract/model/app_user.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final AppUser user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user.email];

  @override
  String toString() => 'Authenticated { displayName: ${user.email} }';
}

class Unauthenticated extends AuthenticationState {}
