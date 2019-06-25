import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._();
  static final DatabaseManager instance = DatabaseManager._();
  Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initialise();
    }
    return _database;
  }

  _initialise() async {
    return await openDatabase(
        join(await getDatabasesPath(), "launchpal.db"),
        onCreate: (db, version) {
      switch (version) {
        case 1:
          {
            return db.execute("""
              CREATE TABLE launch_reminder(launch_id INTEGER PRIMARY KEY, net TEXT NOT NULL)
              """);
          }
        default:
          {
            throw Exception("Cannot create database at version $version");
          }
      }
    }, version: 1);
  }
}
