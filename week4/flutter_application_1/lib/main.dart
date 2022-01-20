import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Study'),
          centerTitle: true,
          backgroundColor: Colors.green[400],
          elevation: 1.0,
          toolbarHeight: 70,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        //body부분에 Padding을 위젯을 넣음
        //모든 쪽 20씩 띄우기
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                '<Elevated BUtton>',
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
