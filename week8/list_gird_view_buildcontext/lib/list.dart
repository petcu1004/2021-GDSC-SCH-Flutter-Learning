import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  int count=25;
  final controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        controller: controller,
        itemCount: count,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('$index'),
            onTap: (){},
          );
        },
      ),
    );
  }
}
