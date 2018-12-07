import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Pestaña 1", icon: Icon(Icons.list)),
              Tab(text: "Pestaña 2", icon: Icon(Icons.create)),
              Tab(text: "Pestaña 3", icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            new Container(
                child: Text('Pestaña 1')
            ),
            new Container(
                child: Text('Pestaña 1')
            ),
            new Container(
                child: Text('Pestaña 1')
            ),
          ],
        ),
      ),
    );
  }
}