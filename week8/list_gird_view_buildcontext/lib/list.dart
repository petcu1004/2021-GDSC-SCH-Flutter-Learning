import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(title: Text('1')),
          ListTile(title: Text('2')),
          ListTile(title: Text('3')),
          ListTile(title: Text('4')),
          ListTile(title: Text('5')),
        ],
      ),
    );
  }
}
