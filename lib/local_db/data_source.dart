import 'package:openflutterecommerce/local_db/config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:openflutterecommerce/local_db/data_source_model.dart';

abstract class DataSource {
  Database db;

  String get tableName;

  String get primaryKey;

  Future<Database> openDatabaseConnection() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), OpenFlutterDatabaseConfig.databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: OpenFlutterDatabaseConfig.databaseVersion,
    );

    return database;
  }

  static void _createDb(Database db) {
    OpenFlutterDatabaseConfig.createTablesQueries
        .forEach((createTableQuery) async {
      await db.execute(createTableQuery);
    });
  }

  Future<void> openDatabaseIfNotOpened() async {
    if (db == null) {
      db = await openDatabaseConnection();
    }
  }

  Future<DataSourceModel> get(int id) async {
    return null;
  }

  Future<List<DataSourceModel>> all() async {
    return null;
  }

  Future<void> insert(DataSourceModel model) async {
    await openDatabaseIfNotOpened();

    await db.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(DataSourceModel model) async {
    await openDatabaseIfNotOpened();

    await db.update(
      tableName,
      model.toMap(),
      where: '$primaryKey = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> delete(int id) async {
    await openDatabaseIfNotOpened();

    await db.delete(
      tableName,
      where: '$primaryKey = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    await openDatabaseIfNotOpened();

    await db.rawDelete('DELETE FROM $tableName');
  }
}
