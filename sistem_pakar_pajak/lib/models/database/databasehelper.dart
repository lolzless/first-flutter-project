import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sistem_pakar_pajak/ui/pages/history_page.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'history.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE histories(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      solusi TEXT,
      datetime INTEGER
    )''');
  }

  Future<List<History>> getHistory() async {
    Database db = await instance.database;
    var histories = await db.query('histories', orderBy: 'name');
    List<History> historyList = histories.isNotEmpty
        ? histories.map((c) => History.fromMap(c)).toList()
        : [];
    return historyList;
  }

  Future<History> getHasilsolusi(int id) async {
    final db = await database;
    final maps =
        await db.query('histories', where: 'solusi = ?', whereArgs: [id]);

    return History.fromMap(maps[0]);
  }

  Future<int> add(History history) async {
    Database db = await instance.database;
    return await db.insert('histories', history.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('histories', where: 'id = ?', whereArgs: [id]);
  }
}
