import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class Entity<TKey> extends Equatable{
  final TKey id;

  Entity(this.id);

  @override
  Map<String, dynamic> toMap();

  @override
  List<Object> get props => [];
}
