import 'package:flutter/material.dart';

class Grids extends StatefulWidget {
  const Grids({Key? key}) : super(key: key);

  @override
  _GridsState createState() => _GridsState();
}

class _GridsState extends State<Grids> {
  // List<String> s = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<Map<String, dynamic>> m = [
    {"num": "1", "eng": "one"},
    {"num": "2", "eng": "two"},
    {"num": "3", "eng": "three"},
    {"num": "4", "eng": "four"},
    {"num": "5", "eng": "five"},
    {"num": "6", "eng": "six"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //한 행의 열의 갯수
              mainAxisSpacing: 4.0, //행의 구분 너비
              crossAxisSpacing: 4.0, //열의 구분 너비
              childAspectRatio: 1.0),
          itemCount: m.length,
          itemBuilder: (ctx, index) {
            return Container(
              color: Colors.green[100],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${m[index]['num']} 영어로'),
                    SizedBox(height: 10),
                    Text('${m[index]['eng']}')
                  ],
                ),
              ),
            );
          }),
    );
  }
}
