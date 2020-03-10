import 'package:openflutterecommerce/domain/entities/entity.dart';

class ShippingAddressEntity extends Entity<int> {
  final String title;
  final String address;
  final String city;
  final String country;
  final String postal;
  final bool isDefault;

  ShippingAddressEntity(
    {int id,
    this.title,
    this.address,
    this.city,
    this.country,
    this.postal,
    this.isDefault}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'city': city,
      'country': country,
      'postal': postal,
      'isDefault': isDefault
    };
  }

  @override
  List<Object> get props => [
    id, 
    title, 
    address, 
    city, 
    country, 
    postal, 
    isDefault
  ];
}
