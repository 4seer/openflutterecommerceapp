/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see shipping_address_repository_impl.dart
 */
import 'package:openflutterecommerce/data/model/shipping_address.dart';
import 'package:openflutterecommerce/data/repositories/abstract/shipping_address_repository.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/shipping_address_repository.dart';

class ShippingAddressRepositoryImpl implements ShippingAddressRepository{

  final ShippingAddressDataStorage dataStorage;

  ShippingAddressRepositoryImpl(this.dataStorage);

  @override
  Future addShippingAddress(ShippingAddressModel shippingAddress) async {
    dataStorage.shippingAddresses.add(shippingAddress);
  }

  @override
  Future<List<ShippingAddressModel>> getShippingAddressList() async {
    if ( dataStorage.shippingAddresses?.isEmpty ) {
      FakeShippingAddressRepository repo = FakeShippingAddressRepository();
      dataStorage.shippingAddresses = await repo.getShippingAddressList();
    }
    return dataStorage.shippingAddresses;
  }

  @override
  Future removeShippingAddress(int shippingAddressId ) async {
    dataStorage.shippingAddresses.removeWhere(
      (shippingAddress) => shippingAddress.id == shippingAddressId );
  }

  @override
  Future setDefaultShippingAddress(int shippingAddressId ) async {
    List<ShippingAddressModel> shippingAddresses = dataStorage.shippingAddresses;
    dataStorage.shippingAddresses.clear();
    shippingAddresses.forEach((shippingAddress) {
      dataStorage.shippingAddresses.add(
        shippingAddress
          .copyWith(
            isDefault: shippingAddress.id == shippingAddressId 
          )
      );
    });
  }
  @override
  Future<ShippingAddressModel> getDefaultShippingAddress() async {
    ShippingAddressModel shippingAddress = 
      await dataStorage.shippingAddresses.firstWhere((shippingAddress) => shippingAddress.isDefault);
    return shippingAddress;
  }
}