import 'package:flutter/material.dart';
import 'package:demo_flutter/inventario/views/gestion.dart';
import 'package:demo_flutter/inventario/views/product_list_view.dart';
import 'package:demo_flutter/inventario/views/add_view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Productos", icon: Icon(Icons.list)),
              Tab(text: "Añadir", icon: Icon(Icons.create)),
              Tab(text: "Gestion", icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductListView(),
            AddView(),
            ImportView(),
          ],
        ),
      ),
    );
  }

}