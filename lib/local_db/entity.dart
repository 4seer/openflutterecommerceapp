import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class Entity extends Equatable {
  int get id;

  Map<String, dynamic> toMap();

  @override
  List<Object> get props => [];
}
