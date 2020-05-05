/*
 * @author Martin Appelmann <exlo89@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see user_repository.dart
 */

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/app_user.dart';

abstract class UserRepository {
  /// Sign in with [email] and [password] and return
  /// an access token as [String]
  Future<String> signIn({
    @required String email,
    @required String password,
  });

  /// Sign up with [username] and [password] and return
  /// an access token as [String]
  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  });

  /// Get the user information and return it as [AppUser]
  Future<AppUser> getUser();

  /// Send to [email] a user forget email
  Future<void> forgotPassword({
    @required String email,
  });
}
