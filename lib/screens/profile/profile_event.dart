import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileStartEvent extends ProfileEvent { }

class ProfileMyOrders extends ProfileEvent { }

class ProfileMyOrderDetails extends ProfileEvent { }
