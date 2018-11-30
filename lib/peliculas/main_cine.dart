import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:demo_flutter/peliculas/listapeliculas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Movie App',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  final nombreController = TextEditingController();
  final yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Movie App'),
        ),
        body: Center(
          child: Form (
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding (
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(" Busqueda de Peliculas ")
                )
              ),
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                    labelText: 'Nombre'
                  ),
              ),
              TextFormField(
                controller: yearController,
                decoration: InputDecoration(
                    labelText: 'Año'
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      String peliculas;
                      buscarPeliculas().then((http.Response response) {
                        debugPrint(response.body);
                        peliculas = response.body;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListaPeliculas(jsonPeliculas: peliculas)),
                        );
                      });

                    },
                    child: Text('Buscar'),
                  ),
                )
              )

            ],
          )
        ),
      ),
    );
  }

  Future<http.Response> buscarPeliculas() async {
    return http.get('http://www.omdbapi.com/?s='+nombreController.text+'&r=json&y='+yearController.text+'&apikey=8c5bc446');
  }
}