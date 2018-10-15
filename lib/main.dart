import 'package:flutter/material.dart';
import 'package:demo_flutter/components/main_menu.dart';
import 'package:demo_flutter/views/main_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        drawer: new MainMenu(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text('Demo App')
        ),
        body: Center(
          child: MainView()
        )
      )
    );
  }
}

