import 'package:flutter/material.dart';
import 'package:news_test/models/news.dart';
import 'package:news_test/repositories/news.dart';

class AddController extends ChangeNotifier {
  final _newsRepository = NewsRepository();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  Future<bool> submit() async {
    formKey.currentState?.save();

    if (formKey.currentState?.validate() == true) {
      await _newsRepository.insert(News(
        title: titleController.text,
        content: contentController.text,
        author: authorController.text,
      ));

      return true;
    }

    return false;
  }
}
