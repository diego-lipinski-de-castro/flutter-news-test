import 'package:flutter/material.dart';
import 'package:news_test/models/news.dart';
import 'package:news_test/repositories/news.dart';

class HomeController extends ChangeNotifier {
  final _newsRepository = NewsRepository();

  List<News> _news = [];
  List<News> get news => _news;

  bool _loading = false;
  bool get loading => _loading;

  HomeController() {
    refresh();
  }

  Future<void> refresh() async {
    _loading = true;
    notifyListeners();

    _news = await _newsRepository.getAll();

    _loading = false;
    notifyListeners();
  }

  delete(int id) async {
    await _newsRepository.delete(id);
    refresh();
  }
}
