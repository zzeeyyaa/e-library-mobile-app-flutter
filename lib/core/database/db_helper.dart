// ignore_for_file: avoid_print

import 'package:e_library/core/database/db_tables.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  const DatabaseHelper();
  static late Database _database;

  Future<void> initializeDatabase() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, 'elib.db');

      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await _createTables(db);
        },
      );
      print('Database opened successfully');
      await printTables();
      await get('drug_inventory');
    } catch (e) {
      print('Error opening database: $e');
    }
  }

  Future<void> _createTables(Database db) async {
    try {
      await db.execute(createUser);
      await db.execute(createBook);
    } catch (e) {
      print('Error creating tables: $e');
    }
  }

  Future<List<Map<String, dynamic>>> get(String table) async {
    try {
      final result = await _database.query(table);
      return result;
    } catch (e) {
      print('Error fetching data: $e');
      await initializeDatabase();
      return [];
    }
  }

  Future<Map<String, dynamic>?> getById(
      String table, String idField, int id) async {
    try {
      final result = await _database.query(
        table,
        where: '$idField = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        return result.first;
      } else {
        print('Data not found');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getListById(
    String table,
    String idField,
    int id,
  ) async {
    try {
      final result = await _database.query(
        table,
        where: '$idField = ?',
        whereArgs: [id],
      );
      if (result.isNotEmpty) {
        return result;
      } else {
        print('Data not found');
        return [
          {'name': 'No Option'}
        ];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<int> updateField(
    String table,
    String field,
    dynamic newValue,
    String idField,
    int id,
  ) async {
    try {
      final values = {field: newValue};
      final count = await _database.update(
        table,
        values,
        where: '$idField = ?',
        whereArgs: [id],
      );
      return count;
    } catch (e) {
      print('Error updating field: $e');
      return 0;
    }
  }

  Future<void> create(String table, Map<String, dynamic> data) async {
    try {
      final exists = await _dataExists(table, data);
      if (!exists) {
        await _database.insert(table, data);
        print('Data created successfully');
      } else {
        print('Data already exists, skipping creation.');
      }
    } catch (e) {
      print('Error creating data: $e');
    }
  }

  Future<bool> createOrUpdate(
      String table, Map<String, dynamic> data, String titleId) async {
    try {
      final List<Map<String, dynamic>> existingRows = await get(table);
      print(existingRows);
      final id = data[titleId] as int;
      final Map<String, dynamic> existingRow = existingRows.firstWhere(
        (row) => row[titleId] == id,
        orElse: () => <String, dynamic>{},
      );

      print(existingRow);

      if (existingRow.isNotEmpty) {
        if (_fieldsAreEqual(existingRow, data)) {
          print(
              'Data with the same ID and values already exists, skipping creation.');
          return false;
        } else {
          await _updateRow(table, id, data, titleId);
          print(
              'Data with the same ID but different values updated successfully.');
          return true;
        }
      } else {
        await _database.insert(table, data);
        print('New data created successfully.');
        return true;
      }
    } catch (e) {
      print('Error creating or updating data: $e');
      return false;
    }
  }

  bool _fieldsAreEqual(
      Map<String, dynamic> existingRow, Map<String, dynamic> newData) {
    for (final key in newData.keys) {
      if (existingRow[key] != newData[key]) return false;
    }
    return true;
  }

  Future<void> _updateRow(
    String table,
    int id,
    Map<String, dynamic> newData,
    String titleId,
  ) async {
    try {
      await _database.update(
        table,
        newData,
        where: '$titleId = ?',
        whereArgs: [id],
      );
      print('Data updated successfully.');
      final data = get(table);
      print(data);
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  Future<bool> _dataExists(String table, Map<String, dynamic> data) async {
    try {
      final columns = data.keys.join(', ');
      final values = data.values.map((value) => "'$value'").join(', ');
      final query = 'SELECT * FROM $table WHERE ($columns) = ($values)';
      final result = await _database.rawQuery(query);
      return result.isNotEmpty;
    } catch (e) {
      print('Error checking data existence: $e');
      return false;
    }
  }

  Future<void> printTables() async {
    try {
      final db = _database;
      final List<Map<String, dynamic>> tables = await db
          .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
      print('Tables in the database:');
      for (var table in tables) {
        print(table['name']);
      }
    } catch (e) {
      print('Error fetching table list: $e');
    }
  }
}
