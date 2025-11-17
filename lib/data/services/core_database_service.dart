import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CoreDatabaseService {
  static final CoreDatabaseService _instance = CoreDatabaseService._internal();
  factory CoreDatabaseService() => _instance;
  CoreDatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static get instance => null;

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'core_database.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE example_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        job TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE example_table ADD COLUMN age INTEGER');
    }
  }

  Future<int> insertDatabase(Map<String, dynamic> row) async {
    try {
      final db = await database;
      return await db.insert('example_table', row);
    } catch (e) {
      throw Exception("Insert failed: $e");
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query('example_table');
  }

  Future<int> updateDatabase(Map<String, dynamic> row) async {
    try {
      final db = await database;
      final id = row['id'] as int;
      return await db.update(
        'example_table',
        row,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception("Update failed: $e");
    }
  }

  Future<int> deleteDatabase(int id) async {
    try {
      final db = await database;
      return await db.delete(
        'example_table',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception("Delete failed: $e");
    }
  }

  Future<Map<String, dynamic>> getItemById(int id) async {
    final db = await database;
    final results = await db.query(
      'example_table',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      throw Exception('Item with id $id not found');
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
