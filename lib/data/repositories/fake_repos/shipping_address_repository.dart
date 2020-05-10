/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see shipping_address_repository.dart
 */
import 'package:openflutterecommerce/data/model/shipping_address.dart';
import 'package:openflutterecommerce/data/repositories/abstract/shipping_address_repository.dart';

class FakeShippingAddressRepository implements ShippingAddressRepository{

  final ShippingAddressDataStorage dataStorage = ShippingAddressDataStorage([
    ShippingAddressModel(
      id: 1,
      fullName: 'Andrew Poteryahin',
      address: '3 Newbridge Hills',
      city: 'Los Angeles',
      state: 'CA',
      postal: '91709', 
      country: 'United States',
      isDefault: true
    ),
    ShippingAddressModel(
      id: 2,
      fullName: 'Andrew Poteryahin',
      address: '4 Gold Smith Road',
      city: 'Seatle',
      state: 'WA',
      postal: '93709', 
      country: 'United States',
      isDefault: true
    )
  ]);
  @override
  Future addShippingAddress(ShippingAddressModel shippingAddress) {
    // TODO: implement addShippingInfo
    throw UnimplementedError();
  }

  @override
  Future<List<ShippingAddressModel>> getShippingAddressList() async {
    return dataStorage.shippingAddresses;
  }

  @override
  Future removeShippingAddress(int shippingAddressId ) {
    // TODO: implement removeShippingInfo
    throw UnimplementedError();
  }

  @override
  Future setDefaultShippingAddress(int shippingAddressId ) {
    // TODO: implement setDefaultShippingInfo
    throw UnimplementedError();
  }

  @override
  Future<ShippingAddressModel> getDefaultShippingAddress() {
    // TODO: implement getDefaultShippingAddress
    throw UnimplementedError();
  }
}