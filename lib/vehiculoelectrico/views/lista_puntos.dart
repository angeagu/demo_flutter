import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_flutter/vehiculoelectrico/beans/punto_recarga.dart';
import 'package:demo_flutter/vehiculoelectrico/views/detalle_punto.dart';

class ListaPuntos extends StatefulWidget {

  String codigoPostal;

  @override
  State createState() => new ListaDinamica(codigoPostal: codigoPostal);

  ListaPuntos({@required codigoPostal}) {
    this.codigoPostal = codigoPostal;
  }

}

class ListaDinamica extends State<ListaPuntos> {

  String codigoPostal;
  List<PuntoRecarga> listaPuntosRecarga;

  ListaDinamica({@required codigoPostal}) {
    this.codigoPostal = codigoPostal;
    this.listaPuntosRecarga = <PuntoRecarga>[];
    this.getPuntos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puntos de Recarga en " + this.codigoPostal),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              Expanded(
                  child: new ListView.separated
                    (
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: listaPuntosRecarga.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        var puntoRecarga = listaPuntosRecarga[index] as PuntoRecarga;
//                        debugPrint(puntoRecarga.identificador.toString() + ' - ' + puntoRecarga.descripcion.toString()
//                            + ' - ' + puntoRecarga.posicion.toString());
                        return new ListTile(
                            title: puntoRecarga.identificador != null ? Text(
                                puntoRecarga.identificador, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)) : Text(''),
                            subtitle: puntoRecarga.descripcion != null ? Text(
                                puntoRecarga.descripcion) : Text(''),
                            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.lightBlue,),
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
        var codigoPostalElement = atributos.where((atributo) => atributo['name'] == 'CodigoPostal' && atributo['string'] != null).toList()[0];
        var codigoPostalString = codigoPostalElement['string'];
        if (codigoPostalString.startsWith(this.codigoPostal)) {
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
        }
      });
      setState(() {});
    });
  }

  Future<http.Response> getJsonData() async {
    return http.get(
        'https://datosabiertos.jcyl.es/web/jcyl/risp/es/energia/vehiculo_electrico/1284273412751.json');
  }
}