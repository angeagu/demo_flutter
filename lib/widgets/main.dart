import 'package:flutter/material.dart';
import 'package:demo_flutter/widgets/container/container-row-column.dart';
import 'package:demo_flutter/peliculas/listapeliculas.dart';

void main() => runApp(MyApp());


class ViewRef {
  String title;
  String subtitle;
  StatelessWidget view;

  ViewRef(this.title, this.subtitle, this.view);
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Widget Gallery',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  List<ViewRef> listaWidgets = getWidgetList();

  static List<ViewRef> getWidgetList() {
    List<ViewRef> lista = [];
    lista.add(new ViewRef("Container/Row/Column", "Widgets de layout simples", new ContainerRowColumn()));
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Widget Gallery'),
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
                        itemCount: listaWidgets.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          var widgetRef = listaWidgets[index] as ViewRef;
                          return new ListTile(
                              title: widgetRef.title != null ? Text(widgetRef.title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)) : Text(''),
                              subtitle: widgetRef.subtitle != null ? Text(widgetRef.subtitle) : Text(''),
                              trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.lightGreen,),
                              onTap: () {
                                StatelessWidget widget = widgetRef.view;
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => widget));
                              }
                          );
                        }
                    )
                ),
              ]
          ),
        )
      );
  }
}