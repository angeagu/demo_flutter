import 'package:flutter/material.dart';
import 'package:demo_flutter/inventario/beans/producto.dart';
import 'package:demo_flutter/inventario/beans/inventario.dart';

class AddView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
    final nombreController = TextEditingController();
    final descripcionController = TextEditingController();
  final numExistenciasController = TextEditingController();
  final precioController = TextEditingController();
  Inventario inventario = new Inventario();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nombreController,
            decoration: InputDecoration(
                labelText: 'Nombre'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor indique nombre';
              }
            },
          ),
          TextFormField(
            controller: descripcionController,
            decoration: InputDecoration(
                labelText: 'Descripcion'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor indique descripcion';
              }
            },
          ),
          TextFormField(
            controller: numExistenciasController,
            decoration: InputDecoration(
                labelText: 'Numero Existencias'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor indique numero existencias';
              }
            },
          ),
          TextFormField(
            controller: precioController,
            decoration: InputDecoration(
                labelText: 'Precio'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor indique precio';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  //TODO Añadir al inventario
                  int index = inventario.getProductos().length + 1;
                  Producto p = Producto(index,nombreController.text, descripcionController.text, true,
                      int.parse(numExistenciasController.text),double.parse(precioController.text));
                  inventario.anadirProducto(p);
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Producto añadido correctamente")));
                }
              },
              child: Text('Añadir'),
            ),
          ),
        ],
      ),
    );
  }

}