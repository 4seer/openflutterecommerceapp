import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/repos/models/product_review.dart';
import 'package:openflutterecommerce/repos/models/user_order.dart';


@immutable
class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProfileInitialState extends ProfileState {}


@immutable
class ProfileMyOrdersProcessingState extends ProfileState { }

@immutable
class ProfileMyOrdersState extends ProfileState {
  final List<UserOrder> orderData;

  ProfileMyOrdersState({this.orderData});
}

@immutable
class ProfileMyOrderDetailsState extends ProfileState {
  final UserOrder orderData;

  ProfileMyOrderDetailsState({this.orderData});
}
