
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/checkout/shipping_address_entity.dart';

class ShippingAddressModel extends ShippingAddressEntity {
  ShippingAddressModel(
    {@required int id,
    String fullName,
    String address,
    String city,
    String state,
    String postal,
    String country,
    bool isDefault}
  ) : super(
      id: id,
      fullName: fullName,
      address: address,
      city: city,
      state: state,
      postal: postal,
      country: country,
      isDefault: isDefault);

  ShippingAddressModel copyWith(
    {int id,
    String fullName,
    String address,
    String city,
    String state,
    String postal,
    String country,
    bool isDefault})  
  {
    return ShippingAddressModel(
      id: id ?? id,
      fullName: fullName ?? fullName,
      address: address ?? address,
      city: city ?? city,
      state: state ?? state,
      postal: postal ?? postal,
      country: country ?? country,
      isDefault: isDefault ?? isDefault
    );
  }
}
