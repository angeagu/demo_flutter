import 'package:flutter/material.dart';
import 'package:demo_flutter/inventario/views/add_view.dart';
import 'package:demo_flutter/misc/views/gestion_alumnos.dart';
import 'package:demo_flutter/inventario/views/gestion.dart';
import 'package:demo_flutter/misc/views/export.dart';
import 'package:demo_flutter/inventario/views/product_list_view.dart';

class MainMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MainMenuState();
  }

}

class MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {

    return new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Angel Aguado"),
                accountEmail: null
            ),
            ListTile(
              title: Text('Calendario'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListView()),
                );
              },
            ),
            ListTile(
              title: Text('Gestion Alumnos'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GestionAlumnosView()),
                );
              },
            ),
            ListTile(
              title: Text('Exportar'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExportView()),
                );
              },
            ),
            ListTile(
              title: Text('Importar'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImportView()),
                );
              },
            ),
            ListTile(
              title: Text('Backup'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddView()),
                );
              },
            ),
          ],
        )
    );
  }

}