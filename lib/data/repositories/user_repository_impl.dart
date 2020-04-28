/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see user_repository_impl.dart
 */

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/app_user.dart';
import 'package:openflutterecommerce/data/abstract/user_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/remote_user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteUserRepository remoteUserRepository;

  UserRepositoryImpl({@required this.remoteUserRepository});

  @override
  Future<String> signIn({
    @required String email,
    @required String password,
  }) async {
    return remoteUserRepository.signIn(email: email, password: password);
  }

  @override
  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    return remoteUserRepository.signUp(name: name, email: email, password: password);
  }

  @override
  Future<AppUser> getUser() async {
    try {
      return remoteUserRepository.getUser();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    @required String email,
  }) async {
      return remoteUserRepository.forgotPassword(email: email);
  }
}
