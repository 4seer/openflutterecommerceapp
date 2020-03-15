import 'package:openflutterecommerce/domain/entities/entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'config.dart';

abstract class DataSource {
  Database db;

  String get tableName;

  String get primaryKey;

  // connect to database
  Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), OpenFlutterDatabaseConfig.databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: OpenFlutterDatabaseConfig.databaseVersion,
    );
  }

  static void _createDb(Database db) {
    OpenFlutterDatabaseConfig.createTablesQueries
        .forEach((createTableQuery) async {
      await db.execute(createTableQuery);
    });
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
    checkDatabaseConnection();

    await db.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // update a record in the table
  Future<void> update(Entity model) async {
    checkDatabaseConnection();

    await db.update(
      tableName,
      model.toMap(),
      where: '$primaryKey = ?',
      whereArgs: [model.id],
    );
  }

  // delete a record in the table
  Future<void> delete(int id) async {
    checkDatabaseConnection();

    await db.delete(
      tableName,
      where: '$primaryKey = ?',
      whereArgs: [id],
    );
  }

  // delete all records in the table
  Future<void> deleteAll() async {
    checkDatabaseConnection();

    await db.rawDelete('DELETE FROM $tableName');
  }

  // close database connection
  Future<void> close() async {
    checkDatabaseConnection();
    await db.close();
  }

  void checkDatabaseConnection() {
    if (db == null) {
      throw Exception(
          'No open connection to database - call .open() on the datasource to establish a connection to the database');
    }
  }
}
