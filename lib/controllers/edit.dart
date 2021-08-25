import 'package:flutter/material.dart';
import 'package:news_test/models/news.dart';
import 'package:news_test/repositories/news.dart';

class EditController extends ChangeNotifier {
  final _newsRepository = NewsRepository();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController contentController;
  late TextEditingController authorController;

  late News _news;

  EditController(News news) {
    _news = news;

    titleController = TextEditingController(text: _news.title);
    contentController = TextEditingController(text: _news.content);
    authorController = TextEditingController(text: _news.author);
  }

  Future<bool> submit() async {
    formKey.currentState?.save();

    if (formKey.currentState?.validate() == true) {
      await _newsRepository.update(News(
        id: _news.id,
        title: titleController.text,
        content: contentController.text,
        author: authorController.text,
      ));

      return true;
    }

    return false;
  }
}
