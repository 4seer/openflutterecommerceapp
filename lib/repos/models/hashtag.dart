// Hashtag model declaration
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HashTag extends Equatable {
  final int id;
  final String title;

  HashTag({@required this.id, @required this.title});

  @override
  List<Object> get props => [id, title];
}
