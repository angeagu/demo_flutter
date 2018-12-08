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
                ),
                Row(
                  children: <Widget>[
                    Text('Dropdown button'),
                    Container(
                        height: 50,
                        width: 150,
                        child: DropdownButton(isExpanded: true, value: '09', items: [
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Avila")), value:'05'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Burgos")), value: '09'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Leon")), value: '24'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Palencia")), value: '34'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Valladolid")), value: '47'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Salamanca")), value: '37'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Segovia")), value: '40'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Soria")), value: '42'),
                          DropdownMenuItem(child: new SizedBox(width: 50,height: 50,child: Text("Zamora")), value: '49'),
                        ],
                        onChanged: null)
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Checkbox'),
                    Expanded(
                      child: CheckboxListTile(title: Text('activado'), value: true, onChanged: null),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Radio'),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 50,width: 200,child: RadioListTile(title: Text("Hombre"), value: 'H', groupValue: null, onChanged: null)),
                        SizedBox(height: 50,width: 200,child: RadioListTile(title: Text("Mujer"), value: 'M', groupValue: null, onChanged: null))
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Slider'),
                    Expanded(
                      child: Slider(value: 10, min: 0, max: 100, onChanged: null)
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}