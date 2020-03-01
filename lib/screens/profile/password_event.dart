import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

class PasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

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
