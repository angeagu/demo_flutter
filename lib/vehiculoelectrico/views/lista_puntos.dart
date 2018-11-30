import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_flutter/vehiculoelectrico/beans/punto_recarga.dart';
import 'package:demo_flutter/vehiculoelectrico/views/detalle_punto.dart';

class ListaPuntos extends StatefulWidget {

  String provincia;

  @override
  State createState() => new ListaDinamica(provincia: provincia);

  ListaPuntos({@required provincia}) {
    this.provincia = provincia;
  }

}

class ListaDinamica extends State<ListaPuntos> {

  String provincia;
  List<PuntoRecarga> listaPuntosRecarga;

  ListaDinamica({@required provincia}) {
    this.provincia = provincia;
    this.listaPuntosRecarga = <PuntoRecarga>[];
    this.getPuntos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puntos de Recarga en " + provincia),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              Expanded(
                  child: new ListView.builder
                    (
                      itemCount: listaPuntosRecarga.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        var puntoRecarga = listaPuntosRecarga[index] as PuntoRecarga;
//                        debugPrint(puntoRecarga.identificador.toString() + ' - ' + puntoRecarga.descripcion.toString()
//                            + ' - ' + puntoRecarga.posicion.toString());
                        return new ListTile(
                            title: puntoRecarga.identificador != null ? Text(
                                puntoRecarga.identificador) : Text(''),
                            subtitle: puntoRecarga.descripcion != null ? Text(
                                puntoRecarga.descripcion) : Text(''),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      DetallePunto(
                                          puntoRecarga: puntoRecarga)));
                            }
                        );
                      }
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

  List<ListTile> getPuntos() {
    getJsonData().then((response) {
      var parsedJson = json.decode(response.body);
      var document = parsedJson['document'];
      var lista = document['list'] as List;
      lista.forEach((item) {
        PuntoRecarga puntoRecarga = new PuntoRecarga();
        var element = item['element'];
        var atributos = element['attribute'] as List;
        atributos.forEach((atributo) {
          if (atributo['name'] == 'Posicion' && atributo['string'] != null) {
            puntoRecarga.posicion = atributo['string'];
          }
          if (atributo['name'] == 'DatosPersonales' &&
              atributo['string'] != null) {
            puntoRecarga.identificador = atributo['string'];
          }
          if (atributo['name'] == 'NombreOrganismo' &&
              atributo['string'] != null) {
            puntoRecarga.descripcion = atributo['string'];
          }
        });
        listaPuntosRecarga.add(puntoRecarga);
      });
      setState(() {});
    });
  }

  Future<http.Response> getJsonData() async {
    return http.get(
        'https://datosabiertos.jcyl.es/web/jcyl/risp/es/energia/vehiculo_electrico/1284273412751.json');
  }
}