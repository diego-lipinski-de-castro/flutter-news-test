import 'package:flutter/material.dart';
import 'package:news_test/models/news.dart';
import 'package:news_test/repositories/news.dart';

class SearchController extends ChangeNotifier {
  final _newsRepository = NewsRepository();

  List<News> _news = [];
  List<News> get news => _news;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> search(String text) async {
    _loading = true;
    notifyListeners();

    _news = await _newsRepository.searchByTitle(text);

    _loading = false;
    notifyListeners();
  }
}
