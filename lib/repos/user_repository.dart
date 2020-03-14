// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/app_user.dart';

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

  /// Get the user information and return it as [AppUser]
  Future<AppUser> getUser() async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return AppUser(token: 'token');
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
      throw error;
    }
  }
}
