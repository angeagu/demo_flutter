import 'package:flutter/material.dart';
import 'dart:convert';

class ListaPeliculas extends StatelessWidget {

  String jsonPeliculas;
  List<Pelicula> listaPeliculas;

  ListaPeliculas({@required jsonPeliculas}) {
    this.jsonPeliculas = jsonPeliculas;
    debugPrint(this.jsonPeliculas);
    var parsedJson = json.decode(this.jsonPeliculas);
    Busqueda busqueda = Busqueda.fromJson(parsedJson);
    this.listaPeliculas = busqueda.peliculas;

    this.listaPeliculas.forEach((pelicula) {
      debugPrint("Pelicula: " + pelicula.title);
    });
  }
  
  getListItems() {
    List<ListTile> items = List<ListTile>();
    this.listaPeliculas.forEach((pelicula) {
      items.add(new ListTile(
          leading: Image.network(pelicula.poster,height: 60.0, width: 80.0),
          title: Text(pelicula.title),
          subtitle: Text(pelicula.year.toString())
        )
      );
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Peliculas"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child:
                new ListView(
                shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: getListItems(),
                )
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver"),
            ),
          ]
        ),
      ),
    );
  }

}

class Busqueda {
  List<Pelicula> peliculas;

  Busqueda({this.peliculas});

  factory Busqueda.fromJson(Map<String, dynamic> parsedJson){
    var busqueda = parsedJson['Search'] as List;
    List<Pelicula> lista = busqueda.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
    return new Busqueda(
      peliculas: lista
    );
  }
}

class Pelicula {
  String title;
  String year;
  String poster;

  Pelicula({this.title, this.year, this.poster});

  factory Pelicula.fromJson(Map<String, dynamic> parsedJson) {
    return new Pelicula(
      title: parsedJson['Title'],
      year: parsedJson['Year'],
      poster: parsedJson['Poster']
    );
  }

}