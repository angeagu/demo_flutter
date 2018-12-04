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

  var mapProvincias = {
    'Avila': '05',
    'Burgos': '09',
    'Leon': '24',
    'Palencia': '34',
    'Salamanca': '37',
    'Segovia': '40',
    'Soria': '42',
    'Valladolid': '47',
    'Zamora': '49'
  };
  var _codigo;

  @override
  Widget build(BuildContext context) {
    _codigo = this.mapProvincias['Avila'];
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
              child: Column(
                  children: getRadioButtonsProvincias(context)
              )
            ),
          ]
        )
      )
    ),
    );
  }

  List<Widget> getRadioButtonsProvincias(context) {
    List<Widget> widgets = [];
    this.mapProvincias.forEach((String provincia, String codigo) {
      var boton = RadioListTile<String>(
        title: Text(provincia),
        value: codigo,
        groupValue: _codigo,
        onChanged: (String codigo) { _codigo = codigo;},
      );
      widgets.add(boton);
    });
    var botonBuscar = RaisedButton(
        child: Text('Buscar'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPuntos(codigoPostal: _codigo)));
        }
    );
    widgets.add(botonBuscar);
    return widgets;
  }


}