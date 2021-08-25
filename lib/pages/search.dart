import 'package:flutter/material.dart';
import 'package:news_test/controllers/search.dart';
import 'package:news_test/pages/show.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    SearchController searchController = Provider.of<SearchController>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isEmpty) return;

            searchController.search(value);
          },
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 10, 12, 6),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            labelText: 'Pesquisar',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: searchController.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: searchController.news.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ShowNewsPage(news: searchController.news[index]),
                          ),
                        );
                    },
                  title: Text(searchController.news[index].title),
                  subtitle: Text(searchController.news[index].author),
                );
              },
            ),
    );
  }
}
