import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';

class ShippingAddressEntity extends Entity<int> {
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;
  final bool isDefault;

  ShippingAddressEntity(
    {int id, 
    @required this.fullName, 
    @required this.address, 
    @required this.city,
    @required this.state,
    @required this.postal,
    @required this.country,
    @required this.isDefault}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'address': address,
      'city': city,
      'state': state,
      'postal': postal,
      'country': country,
      'isDefault': isDefault
    };
  }

  @override
  List<Object> get props => [
    id, 
    fullName, 
    address, 
    city,
    state,
    postal,
    country,
    isDefault
  ];

  @override
  String toString() =>
      address + ', ' + city + ', ' + state + ' ' + postal + ', ' + country;

  @override
  bool get stringify => false;
}
