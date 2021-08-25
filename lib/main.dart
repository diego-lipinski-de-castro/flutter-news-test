import 'package:flutter/material.dart';
import 'package:news_test/controllers/add.dart';
import 'package:news_test/controllers/home.dart';
import 'package:news_test/controllers/search.dart';
import 'package:news_test/services/database.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter News',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: HomePage(),
      ),
    );
  }
}
