import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/order/user_order_data_source.dart';
import 'package:openflutterecommerce/domain/entities/order/user_order_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test UserOrder Data Source', () {
    UserOrderDataSource dataSource;

    setUp(() async {
      dataSource = UserOrderDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in UserOrder table', () async {
      UserOrderEntity data = UserOrderEntity(
          id: 1,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'new',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00);
      await dataSource.insert(data);

      UserOrderEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in UserOrder table', () async {
      UserOrderEntity data = UserOrderEntity(
          id: 1,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'new',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00);
      await dataSource.insert(data);

      UserOrderEntity insertedData = await dataSource.get(data.id);

      UserOrderEntity dataToUpdate = UserOrderEntity(
          id: insertedData.id,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'paid',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00);

      await dataSource.update(dataToUpdate);

      UserOrderEntity updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in UserOrder table', () async {
      await dataSource.insert(UserOrderEntity(
          id: 1,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'new',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00));
      await dataSource.insert(UserOrderEntity(
          id: 2,
          orderNumber: 002244,
          trackingNumber: '12124',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 5.0,
          discountTitle: 'Discount Title 2',
          shippingAddressId: 2,
          orderStatus: 'sent',
          totalAmount: 1000.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00));
      await dataSource.insert(UserOrderEntity(
          id: 3,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 13,
          discountTitle: 'Discount Title 3',
          shippingAddressId: 3,
          orderStatus: 'sent',
          totalAmount: 475.99,
          deliveryMethodId: 2,
          deliveryPrice: 15.00));

      await dataSource.deleteAll();

      List<UserOrderEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: delete a record in UserOrder table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(UserOrderEntity(
          id: 1,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'new',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00));

      await dataSource.delete(1);

      List<UserOrderEntity> allRecords = await dataSource.all();
      expect(allRecords.isEmpty, true);
    });

    test('test: get all records in UserOrder table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(UserOrderEntity(
          id: 1,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 2.5,
          discountTitle: 'Discount Title',
          shippingAddressId: 1,
          orderStatus: 'new',
          totalAmount: 550.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00));
      await dataSource.insert(UserOrderEntity(
          id: 2,
          orderNumber: 002244,
          trackingNumber: '12124',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 5.0,
          discountTitle: 'Discount Title 2',
          shippingAddressId: 2,
          orderStatus: 'sent',
          totalAmount: 1000.00,
          deliveryMethodId: 1,
          deliveryPrice: 10.00));
      await dataSource.insert(UserOrderEntity(
          id: 3,
          orderNumber: 002244,
          trackingNumber: '993434',
          productCount: 4,
          promoCodeId: 1,
          discountPercent: 13,
          discountTitle: 'Discount Title 3',
          shippingAddressId: 3,
          orderStatus: 'sent',
          totalAmount: 475.99,
          deliveryMethodId: 2,
          deliveryPrice: 15.00));
      List<UserOrderEntity> allRecords = await dataSource.all();
      expect(allRecords.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
