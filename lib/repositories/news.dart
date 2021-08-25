import 'package:news_test/models/news.dart';
import 'package:news_test/services/database.dart';

class NewsRepository {
  String _table = 'news';
  final _databaseService = DatabaseService();

  Future<List<News>> getAll() async {
    final db = await _databaseService.db;

    List<Map<String, dynamic>> results = await db.query(
      _table,
      columns: ['id', 'title', 'content', 'author'],
    );

    return results.map((e) => News.fromMap(e)).toList();
  }

  Future<News?> getById(int id) async {
    final db = await _databaseService.db;

    List<Map<String, dynamic>> results = await db.query(
      _table,
      columns: ['id', 'title', 'content', 'author'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return News.fromMap(results.first);
    }

    return null;
  }

  Future<News> insert(News news) async {
    final db = await _databaseService.db;

    news.id = await db.insert(_table, news.toMap());
    return news;
  }

  Future<int> delete(int id) async {
    final db = await _databaseService.db;

    return await db.delete(
      _table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(News news) async {
    final db = await _databaseService.db;

    return await db.update(
      _table,
      news.toMap(),
      where: 'id = ?',
      whereArgs: [news.id],
    );
  }

  Future<List<News>> searchByTitle(String title) async {
    final db = await _databaseService.db;

    List<Map<String, dynamic>> results = await db.query(
      _table,
      columns: ['id', 'title', 'content', 'author'],
      where: 'title LIKE ?',
      whereArgs: ['%$title%'],
    );

    return results.map((e) => News.fromMap(e)).toList();
  }
}
