import 'package:flutter/material.dart';
import 'package:news_test/controllers/add.dart';
import 'package:provider/provider.dart';

class AddNewsPage extends StatefulWidget {
  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  @override
  Widget build(BuildContext context) {
    AddController addController = Provider.of<AddController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar notícia'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          key: addController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: addController.titleController,
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
                controller: addController.contentController,
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
                controller: addController.authorController,
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
          bool ok = await addController.submit();

          if (ok) {
            Navigator.of(context).pop(true);
          } else {
            // Show message
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
