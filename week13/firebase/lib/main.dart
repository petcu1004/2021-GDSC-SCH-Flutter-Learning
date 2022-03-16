import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'memoScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter 코어엔진 초기화
  await Firebase.initializeApp(); //파베 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: memoPage(),
    );
  }
}

class memoPage extends StatelessWidget {
  const memoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const memoScreen();
  }
}
