import 'package:flutter/material.dart';
import 'package:news_test/controllers/edit.dart';
import 'package:news_test/models/news.dart';
import 'package:provider/provider.dart';

class EditNewsPage extends StatefulWidget {
  final News news;

  const EditNewsPage({Key? key, required this.news}) : super(key: key);

  @override
  _EditNewsPageState createState() => _EditNewsPageState();
}

class _EditNewsPageState extends State<EditNewsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditController(widget.news),
      child: Consumer<EditController>(
        builder: (context, editController, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Editar notícia'),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Form(
                key: editController.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: editController.titleController,
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O título é obrigatório';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Título',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: editController.contentController,
                      maxLines: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O título é obrigatório';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Conteúdo',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: editController.authorController,
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O título é obrigatório';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Autor',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                bool ok = await editController.submit();

                if (ok) {
                  Navigator.of(context).pop(true);
                } else {
                  // Show message
                }
              },
              child: Icon(Icons.check),
            ),
          );
        },
      ),
    );
  }
}
