import 'package:flutter/material.dart';
//import 'package:map_view/static_map_provider.dart';
//import 'package:map_view/map_view.dart';

class PuntoRecargaMap extends StatelessWidget {

  double latitud;
  double longitud;
  Uri uri;

  PuntoRecargaMap({this.latitud,this.longitud}) {

//    MapView mapView = new MapView();
//    mapView.setCameraPosition(new CameraPosition(
//        new Location(45.526607443935724, -122.66731660813093), 15.0));
//    var uri = provider.getImageUriFromMap(mapView,
//        width: 900, height: 400);
    debugPrint('lat ' + latitud.toString() + ' long: ' + longitud.toString());
//    uri = provider.getStaticUri(new Location(latitud, longitud), 12,
//        width: 400, height: 400, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {

//    MapView mapView = new MapView();
//    mapView.setCameraPosition(new CameraPosition(
//        new Location(45.526607443935724, -122.66731660813093), 15.0));
//    var uri = provider.getImageUriFromMap(mapView,
//        width: 900, height: 400);
//    debugPrint('lat ' + latitud.toString() + ' long: ' + longitud.toString());
//    var uri = provider.getStaticUri(new Location(this.latitud, this.longitud), 12,
//        width: 900, height: 400, mapType: StaticMapViewType.roadmap);

    return new Container(
        height: 500.0,
        width: 400.0,
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Punto de Recarga X')
            ),
            Center(
              child: new Image.network(uri.toString())
            )
          ],
        )
    );

  }
}