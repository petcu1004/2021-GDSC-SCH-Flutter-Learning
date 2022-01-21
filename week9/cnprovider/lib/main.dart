import 'package:cnprovider/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:cnprovider/src/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
            //ChangeNotifierProvider를 통해 변화에 대해 구독 (하나만 구독 가능) /여러 개를 구독하기 위해서는 MultProvider로 감싼 후 사용해야한다.
            create: (BuildContext context) =>
                CountProvider(), //count_provider.dart
            child: Home() //home.dart
            //child 하위에 모든 것들은 CountProvider에 접근할 수 있다.
            ));
  }
}
