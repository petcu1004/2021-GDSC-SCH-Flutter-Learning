import 'package:flutter/material.dart';
import 'package:bloc_pattern/src/ui/bloc_display_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch: Colors.blue,
      ),
      home: BlocDisplayWidget(), //home에서 BlocDisplayWidget()호출함.
    );
  }
}