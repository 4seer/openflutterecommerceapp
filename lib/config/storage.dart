/*
 * @author Martin Appelmann <exlo89@gmail.com
 * @copyright 2020 Open E-commerce App
 * @see storage.dart
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;

  Storage._internal();

  FlutterSecureStorage secureStorage= FlutterSecureStorage();
  String token = '';
}