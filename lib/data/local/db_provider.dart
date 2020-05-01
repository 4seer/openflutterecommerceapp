import 'package:openflutterecommerce/data/local/config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {

  static Database db;
  
  static Future<void> open() async {
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
  
  static Future<void> clear() async {
    await deleteDatabase(join(await getDatabasesPath(), OpenFlutterDatabaseConfig.databaseName));
  }
}