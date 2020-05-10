import 'package:equatable/equatable.dart';

class ShippingAddress extends Equatable {
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;

  ShippingAddress(
      {this.fullName,
      this.address,
      this.city,
      this.state,
      this.postal,
      this.country});

  @override
  List<Object> get props => [fullName, address, city, state, postal, country];

  @override
  String toString() =>
      address + ', ' + city + ', ' + state + ' ' + postal + ', ' + country;

  @override
  bool get stringify => false;
}
