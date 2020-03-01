import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ChangePasswordEvent extends PasswordEvent {
  final String currentPassword;
  final String newPassword;
  final String repeatNewPassword;

  ChangePasswordEvent(
      {@required this.currentPassword,
      @required this.newPassword,
      @required this.repeatNewPassword});

  @override
  List<Object> get props => [currentPassword, newPassword, repeatNewPassword];

  @override
  String toString() => 'ChangePassword Event';
}
