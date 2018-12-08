import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List cadenas = ['Item 1','Item 2','Item 3','Item 4'];
    List<ListTile> items = [];
    cadenas.forEach((item) {
      items.add(new ListTile(
          title: Text(item),
          subtitle: Text('Subtitulo'),
          trailing: Icon(Icons.arrow_forward_ios)
      )
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo Lista"),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              Expanded(
                  child:
                  new ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    children: items
                  )
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Volver"),
              ),
            ]
        ),
      ),
    );
  }

}