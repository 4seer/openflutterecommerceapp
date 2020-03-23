/*
 * @author Martin Appelmann <exlo89@gmail.com
 * @copyright 2020 Open E-commerce App
 * @see user_repository.dart
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/data/remote/constants.dart';
import 'package:openflutterecommerce/data/remote/utils.dart';
import 'package:openflutterecommerce/domain/entities/user/user_entity.dart';

class UserRepository {
  /// Sign in with [email] and [password] and return
  /// an access token as [String]
  Future<String> signIn({
    @required String email,
    @required String password,
  }) async {
    var route = HttpClient().createUri(endpointAuthToken);
    var data = <String, String>{
      'username': email,
      'password': password,
    };

    var response = await http.post(route, body: data);
    Map jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      throw jsonResponse['message'];
    }
    return jsonResponse['token'];
  }

  /// Sign up with [username] and [password] and return
  /// an access token as [String]
  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      var route = HttpClient().createUri(endpointSignUp);
      var data = <String, String>{
        'name': name,
        'username': email,
        'password': password,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return jsonResponse['token'];
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
      print('fake');

      var route = HttpClient().createUri(endpointForgotPassword);
      var data = <String, String>{
        'email': email,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
    } catch (error) {
      rethrow;
    }
  }
}
