import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PuntoRecargaMap extends StatelessWidget {

  double latitud;
  double longitud;
  Uri uri;

  PuntoRecargaMap({this.latitud,this.longitud}) {
    debugPrint('lat ' + latitud.toString() + ' long: ' + longitud.toString());
  }

  @override
  Widget build(BuildContext context) {

    return new Container(
        height: 500.0,
        width: 400.0,
        child: Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: new Text("Punto de Recarga X"),
            ),
            Flexible(
              child: new FlutterMap(
                      options: new MapOptions(
                        center: new LatLng(latitud, longitud),
                        zoom: 18.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'])
                      ]
                  )
            )
          ],
        )
    );

  }
}