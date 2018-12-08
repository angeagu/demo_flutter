import 'package:flutter/material.dart';
import 'package:demo_flutter/widgets/container/container-row-column.dart';
import 'package:demo_flutter/widgets/tab-bar/tab-bar.dart';
import 'package:demo_flutter/widgets/bottom-navigation-bar/bottom-navigation-bar.dart';
import 'package:demo_flutter/widgets/drawer/drawer.dart';
import 'package:demo_flutter/widgets/forms/forms.dart';
import 'package:demo_flutter/widgets/dialogs-alerts/dialogs-alerts.dart';
import 'package:demo_flutter/widgets/list/list.dart';

void main() => runApp(MyApp());


class ViewRef {
  String title;
  String subtitle;
  Widget view;

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
    lista.add(new ViewRef("Tab Bar / Tab View", "Barra de pestañas con diferentes vistas", new TabBarExample()));
    lista.add(new ViewRef("BottomNavigationBar", "Menu de navigacion en la parte baja de la aplicacion", new BottomNavigationBarExample()));
    lista.add(new ViewRef("Drawer", "Menu lateral de tipo slide-in", new DrawerExample()));
    lista.add(new ViewRef("Elementos de Formulario", "Elementos de seleccion e introduccion en formularios, y botones", new Forms()));
    //lista.add(new ViewRef("Dialogos y Alertas", "Elementos de notificacion al usuario, dialogos, confirmacion,etc", new DialogsAlerts()));
    lista.add(new ViewRef("Listas", "Tipico widget de elementos ordenados en forma de lista", new ListExample()));

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
                                Widget widget = widgetRef.view;
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