/*
 * @author Martin Appelmann <exlo89@gmail.com
 * @copyright 2020 Open E-commerce App
 * @see user_repository.dart
 */

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/user/user_entity.dart';

class UserRepository {
  /// Sign in with [email] and [password] and return
  /// an access token as [String]
  Future<String> signIn({
    @required String email,
    @required String password,
  }) async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return 'token';
    } catch (error) {
      rethrow;
    }
  }

  /// Sign up with [username] and [password] and return
  /// an access token as [String]
  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return 'token';
    } catch (error) {
      rethrow;
    }
  }

  /// Get the user information and return it as [UserEntity]
  Future<UserEntity> getUser() async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return UserEntity();
    } catch (error) {
      rethrow;
    }
  }

  /// Send to [email] a user forget email
  Future<void> forgetPassword({
    @required String email,
  }) async {
    try {
      // TODO api call for forget password
      await Future.delayed(Duration(seconds: 2));
    } catch (error) {
      rethrow;
    }
  }
}
