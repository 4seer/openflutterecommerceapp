import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/user/shipping_address_data_source.dart';
import 'package:openflutterecommerce/domain/entities/user/shipping_address_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test ShippingAddress Data Source', () {
    ShippingAddressDataSource dataSource;

    setUp(() async {
      dataSource = ShippingAddressDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in shippingaddress table', () async {
      ShippingAddressEntity data = ShippingAddressEntity(
          id: 1,
          title: 'Silicon Valley',
          address: 'CA - 123',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: true);
      await dataSource.insert(data);

      ShippingAddressEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in shippingaddress table', () async {
      ShippingAddressEntity data = ShippingAddressEntity(
          id: 1,
          title: 'Silicon Valley',
          address: 'CA - 123',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: true);
      await dataSource.insert(data);

      ShippingAddressEntity insertedData = await dataSource.get(data.id);

      ShippingAddressEntity dataToUpdate = ShippingAddressEntity(
          id: insertedData.id,
          title: 'Arkinsas',
          address: 'AK- 170',
          city: 'Conway',
          country: 'United States',
          postal: '00233',
          isDefault: true);

      await dataSource.update(dataToUpdate);

      ShippingAddressEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in shippingaddress table', () async {
      await dataSource.insert(ShippingAddressEntity(
          id: 1,
          title: 'Silicon Valley',
          address: 'CA - 123',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: true));
      await dataSource.insert(ShippingAddressEntity(
          id: 2,
          title: 'Arkinsas',
          address: 'AK- 170',
          city: 'Conway',
          country: 'United States',
          postal: '00233',
          isDefault: false));
      await dataSource.insert(ShippingAddressEntity(
          id: 3,
          title: 'Silicon Valley',
          address: 'CA - 400',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: false));

      await dataSource.deleteAll();

      List<ShippingAddressEntity> allData = await dataSource.all();
      expect(allData.length == 0, true);
    });

    test('test: delete a record in shippingaddress table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ShippingAddressEntity(
          id: 1,
          title: 'Silicon Valley',
          address: 'CA - 123',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233'));

      await dataSource.delete(1);

      List<ShippingAddressEntity> allData = await dataSource.all();
      expect(allData.length == 0, true);
    });

    test('test: get all records in shippingaddress table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(ShippingAddressEntity(
          id: 1,
          title: 'Silicon Valley',
          address: 'CA - 123',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: true));
      await dataSource.insert(ShippingAddressEntity(
          id: 2,
          title: 'Arkinsas',
          address: 'AK- 170',
          city: 'Conway',
          country: 'United States',
          postal: '00233',
          isDefault: false));
      await dataSource.insert(ShippingAddressEntity(
          id: 3,
          title: 'Silicon Valley',
          address: 'CA - 400',
          city: 'Carlifornia',
          country: 'United States',
          postal: '00233',
          isDefault: false));

      List<ShippingAddressEntity> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
