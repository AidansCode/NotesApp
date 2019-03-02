import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notes_app/models/note.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null)
      _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null)
      _database = await initializeDatabase();

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var db = openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  void _createDatabase(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, '
        'note TEXT, created_at TEXT, updated_at TEXT)'
    );
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    Database db = await this.database;

    return await db.rawQuery('SELECT * FROM notes ORDER BY updated_at DESC');
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;

    return await db.insert('notes', note.toMap());
  }

  Future<int> updateNote(Note note) async {
    Database db = await this.database;

    return await db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    Database db = await this.database;

    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> getNoteCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> rawCount = await db.rawQuery('SELECT COUNT(*) FROM notes');
    return Sqflite.firstIntValue(rawCount);
  }

}
