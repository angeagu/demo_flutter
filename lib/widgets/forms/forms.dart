import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Elementos de seleccion y entrada en formulario y botones'),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('TextField'),
                    Expanded(
                      child:
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Precio'
                          ),
                        ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Switch'),
                    Expanded(
                      child: SwitchListTile(
                        title: const Text('Encendido'),
                        value: true,
                      )
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}