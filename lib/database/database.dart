import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static DatabaseProvider databaseProvider = DatabaseProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "flutterAlarm.db");

    Database database = await openDatabase(path,
        version: 1, onCreate: onCreate, onUpgrade: onUpgrade);

    return database;
  }

  FutureOr<void> onCreate(Database db, int version) {
    //create tables here
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      //dropTables here

      onCreate(db, newVersion);
    }
  }
}
