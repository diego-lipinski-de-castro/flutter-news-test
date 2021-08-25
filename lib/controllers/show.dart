import 'package:flutter/material.dart';
import 'package:news_test/models/news.dart';
import 'package:news_test/repositories/news.dart';

class ShowController extends ChangeNotifier {
  final _newsRepository = NewsRepository();
  late News news;

  ShowController(News n) {
    news = n;

    _getNews(n.id!);
  }

  Future<void> _getNews(int id) async {
    News? _news = await _newsRepository.getById(id);

    if (_news != null) {
      news = _news;
      notifyListeners();
    }
  }
}
