import 'package:flutter/material.dart';
import 'package:demo_flutter/inventario/beans/producto.dart';
import 'package:demo_flutter/inventario/beans/inventario.dart';

class ImportView extends StatelessWidget {

  Inventario inventario = new Inventario();
  BuildContext context;
  ListView listView;
  List<ListTile> productList;

  @override
  Widget build(BuildContext context) {

    this.context = context;
    this.productList = getProducts();

    this.listView = new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: this.productList
    );

    return this.listView;

  }

  List<ListTile> getProducts() {
    List<Producto> listaProductos = inventario.getProductos();
    List<ListTile> tileList = List<ListTile>();

    listaProductos.forEach((producto) {
      tileList.add(new ListTile(
          leading: Icon(Icons.folder),
          title: Text(producto.nombre),
          trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {borraProducto(producto);}),
      )
      );
    });

    return tileList;
  }

  borraProducto(Producto p) {
    inventario.borrarProducto(p);
    this.productList = List.from(getProducts());
    Scaffold.of(this.context)
        .showSnackBar(SnackBar(content: Text("Producto borrado correctamente")));
  }

}