import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo Drawer")),
      body: Center(child: Text('Pagina Test')),
      drawer: Drawer(
        // Anadimos una lista al Drawer
        child: ListView(
          // Importante: Quitamos cualquier padding de la lista
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Titulo del Drawer'),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 4'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 5'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
