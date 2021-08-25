import 'package:flutter/material.dart';
import 'package:news_test/controllers/show.dart';
import 'package:news_test/models/news.dart';
import 'package:provider/provider.dart';

class ShowNewsPage extends StatefulWidget {
  final News news;

  const ShowNewsPage({Key? key, required this.news}) : super(key: key);

  @override
  _ShowNewsPageState createState() => _ShowNewsPageState();
}

class _ShowNewsPageState extends State<ShowNewsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShowController(widget.news),
      child: Consumer<ShowController>(
        builder: (context, showController, _) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(showController.news.title),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Autor: ${showController.news.author}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(showController.news.content, style: TextStyle(fontSize: 20),),
                  SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
