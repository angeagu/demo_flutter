import 'package:flutter/material.dart';

class DialogsAlerts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialogs y Alerts'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('Mostrar dialogo simple'),
                  onPressed: _showSimpleDialog(context)
              ),
              RaisedButton(
                child: Text('Mostrar dialogo tipo alerta'),
                onPressed: _showAlertDialog(context)
              ),
            ],
          ),
        )
    );
  }

  _showSimpleDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Alert Dialog'),
          children: <Widget>[
            SimpleDialogOption(child: Text('Opcion 1')),
            SimpleDialogOption(child: Text('Opcion 2')),
          ],
        );
      },
    );
  }

   _showAlertDialog(context) {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert Dialog'),
            content: Text('Mensaje informativo para el usuario'),
            actions: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
  }
}