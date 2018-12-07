import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {

  BottomNavigationBarExample({Key key}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Vista 1'),
    Text('Vista 2'),
    Text('Vista 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo BottomNavigationBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Opcion 1')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Opcion 2')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('Opcion 3')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}