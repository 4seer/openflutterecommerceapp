import 'package:openflutterecommerce/domain/entities/entity.dart';

class ShippingAddressEntity extends Entity<int> {
  final String title;
  final String address;
  final String city;
  final String country;
  final String postal;
  final bool? isDefault;

  ShippingAddressEntity(
    {required int id,
    required this.title,
    required this.address,
    required this.city,
    required this.country,
    required this.postal, this.isDefault}) : super(id);

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
    isDefault!
  ];
}
