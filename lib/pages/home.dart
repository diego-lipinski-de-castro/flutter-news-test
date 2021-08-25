import 'package:flutter/material.dart';
import 'package:news_test/controllers/home.dart';
import 'package:news_test/pages/edit.dart';
import 'package:news_test/pages/search.dart';
import 'package:news_test/pages/show.dart';
import 'package:provider/provider.dart';
import 'add.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Notícias'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: homeController.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: homeController.refresh,
              child: ListView.builder(
                itemCount: homeController.news.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ShowNewsPage(news: homeController.news[index]),
                          ),
                        );
                    },
                    title: Text(homeController.news[index].title),
                    subtitle: Text(homeController.news[index].author),
                    leading: IconButton(
                      onPressed: () async {
                        bool? result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                EditNewsPage(news: homeController.news[index]),
                          ),
                        );

                        if (result == true) {
                          homeController.refresh();
                        }
                      },
                      icon: Icon(Icons.edit),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        homeController.delete(
                          homeController.news[index].id!,
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNewsPage(),
            ),
          );

          if (result == true) {
            homeController.refresh();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
