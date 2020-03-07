import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:openflutterecommerce/local_db/config.dart';
import 'package:openflutterecommerce/local_db/entity.dart';

abstract class DataSource {
  Database db;

  String get tableName;

  String get primaryKey;

  // connect to database
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

  // get a record in the table
  Future<Entity> get(int id) async {
    return null;
  }

  // get all records in the table
  Future<List<Entity>> all() async {
    return null;
  }

  // insert a record into the table
  Future<void> insert(Entity model) async {
    await openDatabaseIfNotOpened();

    await db.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // update a record in the table
  Future<void> update(Entity model) async {
    await openDatabaseIfNotOpened();

    await db.update(
      tableName,
      model.toMap(),
      where: '$primaryKey = ?',
      whereArgs: [model.id],
    );
  }

  // delete a record in the table
  Future<void> delete(int id) async {
    await openDatabaseIfNotOpened();

    await db.delete(
      tableName,
      where: '$primaryKey = ?',
      whereArgs: [id],
    );
  }

  // delete all records in the table
  Future<void> deleteAll() async {
    await openDatabaseIfNotOpened();

    await db.rawDelete('DELETE FROM $tableName');
  }
}
