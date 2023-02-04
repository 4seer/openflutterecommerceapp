/*
 * @author Martin Appelmann <exlo89@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see user_repository.dart
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/config/server_addresses.dart';
import 'package:openflutterecommerce/data/model/app_user.dart';
import 'package:openflutterecommerce/data/repositories/abstract/user_repository.dart';

import '../utils.dart';

class RemoteUserRepository extends UserRepository {
  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    var route = HttpClient().createUri(ServerAddresses.authToken);
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

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var route = HttpClient().createUri(ServerAddresses.signUp);
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

  @override
  Future<AppUser> getUser() async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return AppUser(email: '', password: '', token: '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      var route = HttpClient().createUri(ServerAddresses.forgotPassword);
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
