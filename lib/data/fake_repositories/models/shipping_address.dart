import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends Equatable{
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;

  ShippingAddress({
    @required this.fullName, 
    @required this.address, 
    @required this.city, 
    @required this.state, 
    @required this.postal, 
    @required this.country
  });

  @override
  List<Object> get props => [fullName, address, city, state, postal, country];
  
  @override
  String toString() => address + ', ' + city + ', ' + state + ' ' + postal + ', ' + country;
}