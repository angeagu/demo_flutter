import 'package:flutter/material.dart';

class ContainerRowColumn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Container / Row / Column'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('Simple Container', style: TextStyle(color: Colors.black)),
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.blueAccent,
                  width: 300.0,
                  height: 100.0,
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    color: Colors.redAccent,
                    width: 300.0,
                    height: 100.0,
                  child:Row(
                    children: <Widget>[
                      Text('Elemento1'),
                      Text('Elemento2'),
                      Text('Elemento3'),
                      Text('Elemento4')
                    ],
                )),
                Container(
                  color: Colors.orangeAccent,
                  width: 200.0,
                  height: 300.0,
                  child: Column(
                    children: <Widget>[
                      Text('Texto1'),
                      Text('Texto2'),
                      Text('Texto3'),
                    ],
                  )
                )
              ],
            ),
          )
        );
  }
}