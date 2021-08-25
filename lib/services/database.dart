import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  String _dbName = 'news.db';

  static final DatabaseService _singleton = new DatabaseService.singleton();
  DatabaseService.singleton();

  factory DatabaseService() => _singleton;

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _init();
    }

    return _db!;
  }

  _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(db, v) async {
    await db.execute('''
      create table news (
        id integer primary key autoincrement,
        title text not null,
        content text not null,
        author text not null
      )''');
  }
}
