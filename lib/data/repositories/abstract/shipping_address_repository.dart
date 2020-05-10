/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see shipping_address_repository.dart
 */

import 'package:openflutterecommerce/data/model/shipping_address.dart';

abstract class ShippingAddressRepository {
  //Get list of user shipping information
  Future<List<ShippingAddressModel>> getShippingAddressList();
  //Add shipping info
  Future addShippingAddress(ShippingAddressModel shippingAddress);
  //Set shipping info as default
  Future setDefaultShippingAddress(int shippingAddressId);
  //Remove shipping info
  Future removeShippingAddress(int shippingAddressId);
  //Get default shipping address
  Future<ShippingAddressModel> getDefaultShippingAddress();
}

class ShippingAddressDataStorage {
  List<ShippingAddressModel> shippingAddresses;

  ShippingAddressDataStorage(this.shippingAddresses);
}