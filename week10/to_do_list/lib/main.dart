import 'package:flutter/material.dart';

import 'package:to_do_list/subDetail.dart';
import 'package:to_do_list/thridDetail.dart';
import 'package:to_do_list/secondDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/':(context) => SubDetail(),
        '/second' : (context) => SecondDetail(),
        '/third':(context) => ThirdDetail(),
      },
    );
  }
}

