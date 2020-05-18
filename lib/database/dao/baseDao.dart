import 'package:sqflite/sqlite_api.dart';

abstract class BaseDao<T> {
  Future<void> createTables(Database database);

  Future<void> dropTables(Database database);

  Future<int> insert(T object);

  Future<int> update(T object);

  Future<int> saveToDb(T object);

  Future<int> delete(String id);

  Future<int> deleteTableRecords();

  Future<bool> isExist(String id);

  Future<T> fetchSingle({List<String> columns, String id});

  Future<List<T>> fetchAll({List<String> columns, String query});
}
