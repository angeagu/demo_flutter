import 'package:flutter/material.dart';
import 'package:demo_flutter/inventario/beans/inventario.dart';
import 'package:demo_flutter/inventario/beans/producto.dart';

class ProductListView extends StatelessWidget {
  Inventario inventario = Inventario();

  @override
  Widget build(BuildContext context) {

    return new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: getProducts(),
    );

  }

  List<ListTile> getProducts() {
    List<Producto> listaProductos = inventario.getProductos();
    List<ListTile> tileList = List<ListTile>();
    
    listaProductos.forEach((producto) {
      tileList.add(new ListTile(
        leading: Icon(Icons.folder),
        title: Text(producto.nombre),
        subtitle: Text(producto.descripcion)
      )
      );
    });

    return tileList;
  }

}