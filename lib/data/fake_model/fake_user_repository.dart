/*
 * @author Martin Appelmann <exlo89@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see fake_user_repository.dart
 */

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/app_user.dart';
import 'package:openflutterecommerce/data/abstract/user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future<String> signIn({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'token';
  }

  @override
  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    return 'token';
  }

  @override
  Future<AppUser> getUser() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      return AppUser();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgetPassword({
    @required String email,
  }) async {
    await Future.delayed(Duration(seconds: 3));
  }
}
