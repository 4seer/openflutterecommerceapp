import 'package:openflutterecommerce/domain/entities/extensions.dart';
import 'package:openflutterecommerce/domain/entities/product_attribute.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database database;
  Future isInitialized;
  static final LocalDatabase _singleton = LocalDatabase._internal();

  factory LocalDatabase() {
    return _singleton;
  }

  LocalDatabase._internal() {
    isInitialized = initDatabase();
  }

  Future initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'main.db'),
      onCreate: (db, version) async {
        await db.execute(LocalProduct.create_sql);
        await db.execute(LocalProduct.create_properties_sql);
        await db.execute(LocalProductAttribute.create_sql);
        await db.execute(LocalProductAttribute.create_many_to_many);
        await db.execute(LocalCommerceImage.create_sql);
        await db.execute(LocalCategory.create_sql);
      },
      version: 1,
    );
  }
}
