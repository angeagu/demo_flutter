import 'package:flutter/material.dart';
import 'package:demo_flutter/vehiculoelectrico/beans/punto_recarga.dart';
import 'package:demo_flutter/vehiculoelectrico/components/punto_recarga_map.dart';

class DetallePunto extends StatelessWidget {

  PuntoRecarga puntoRecarga;

  DetallePunto({@required puntoRecarga}) {
    this.puntoRecarga = puntoRecarga;
  }

  @override
  Widget build(BuildContext context) {
    var tokens = puntoRecarga.posicion.split('#');
    var latitud = double.parse(tokens[0]);
    var longitud = double.parse(tokens[1]);
    return new Scaffold(
        appBar: AppBar(
          title: Text(puntoRecarga.identificador),
        ),
        body: Center(
          child: new PuntoRecargaMap(latitud: latitud,longitud: longitud)
        )
    );
  }
}