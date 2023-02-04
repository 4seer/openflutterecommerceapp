import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openflutterecommerce/data/local/user/user_data_source.dart';
import 'package:openflutterecommerce/domain/entities/user/user_entity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test User Data Source', () {
    late UserDataSource dataSource;

    setUp(() async {
      dataSource = UserDataSource();
      await dataSource.open();
    });

    test('test: insert and get a record in user table', () async {
      UserEntity data = UserEntity(
          id: 1,
          name: 'John Doe',
          avatar: 'https://example.com/avatar.png',
          email: 'johndoe@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1997',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false);
      await dataSource.insert(data);

      UserEntity insertedData = await dataSource.get(data.id);
      expect(data == insertedData, true);
    });

    test('test: update a record in user table', () async {
      UserEntity data = UserEntity(
          id: 1,
          name: 'John Doe',
          avatar: 'https://example.com/avatar.png',
          email: 'johndoe@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1997',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false);
      await dataSource.insert(data);

      UserEntity insertedData = await dataSource.get(data.id);

      UserEntity dataToUpdate = UserEntity(
          id: insertedData.id,
          name: 'Will Smith',
          avatar: 'https://example.com/avatar.png',
          email: 'will@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1977',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false);

      await dataSource.update(dataToUpdate);

      var updatedData = await dataSource.get(dataToUpdate.id);
      expect(dataToUpdate == updatedData, true);
    });

    test('test: delete all records in user table', () async {
      await dataSource.insert(UserEntity(
          id: 1,
          name: 'John Doe',
          avatar: 'https://example.com/avatar.png',
          email: 'johndoe@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1997',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));
      await dataSource.insert(UserEntity(
          id: 2,
          name: 'Will Smith',
          avatar: 'https://example.com/avatar.png',
          email: 'will@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1977',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));
      await dataSource.insert(UserEntity(
          id: 3,
          name: 'Clara Davids',
          avatar: 'https://example.com/avatar.png',
          email: 'clara@example.com',
          password: 'xxxxxxxxx',
          birthDate: '12-10-2003',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));

      await dataSource.deleteAll();

      List<UserEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: delete a record in user table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(UserEntity(
          id: 1,
          name: 'John Doe',
          avatar: 'https://example.com/avatar.png',
          email: 'johndoe@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1997',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));

      await dataSource.delete(1);

      List<UserEntity> allData = await dataSource.all();
      expect(allData.isEmpty, true);
    });

    test('test: get all records in user table', () async {
      await dataSource.deleteAll();

      await dataSource.insert(UserEntity(
          id: 1,
          name: 'John Doe',
          avatar: 'https://example.com/avatar.png',
          email: 'johndoe@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1997',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));
      await dataSource.insert(UserEntity(
          id: 2,
          name: 'Will Smith',
          avatar: 'https://example.com/avatar.png',
          email: 'will@example.com',
          password: 'xxxxxxxxx',
          birthDate: '30-03-1977',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));
      await dataSource.insert(UserEntity(
          id: 3,
          name: 'Clara Davids',
          avatar: 'https://example.com/avatar.png',
          email: 'clara@example.com',
          password: 'xxxxxxxxx',
          birthDate: '12-10-2003',
          salesNotification: false,
          newArrivalsNotification: false,
          deliveryStatusChanges: false));

      List<UserEntity> allData = await dataSource.all();
      expect(allData.length == 3, true);
    });

    tearDown(() async {
      await dataSource.close();
    });
  });
}
