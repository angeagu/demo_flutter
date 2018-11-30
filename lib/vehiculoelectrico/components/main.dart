import 'package:flutter/material.dart';
import 'package:demo_flutter/vehiculoelectrico/views/lista_puntos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Vehiculo Electrico - Puntos Recarga',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
        title: Text('Vehiculo Electrico - Puntos Recarga'),
    ),
    body: Center(
      child: Form (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding (
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(" Puntos de Recarga de Vehiculo Electrico")
              )
            ),
            Center(
              child: RaisedButton(
                child: Text('Buscar'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPuntos(provincia: 'Palencia')));
                }
              )
            ),
          ]
        )
      )
    ),
    );
  }
}