import 'package:openflutterecommerce/domain/entities/entity.dart';

class ShippingAddressEngity extends Entity<int> {
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String country;

  ShippingAddressEngity(
    {int id, 
    this.fullName, 
    this.address, 
    this.city,
    this.state,
    this.postal,
    this.country}) : super(id);

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
    country
  ];
}
