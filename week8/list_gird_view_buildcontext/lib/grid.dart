import 'package:flutter/material.dart';

class Grids extends StatefulWidget {
  const Grids({Key? key}) : super(key: key);

  @override
  _GridsState createState() => _GridsState();
}

class _GridsState extends State<Grids> {
  List<String> s = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //한 행의 열의 갯수
              mainAxisSpacing: 4.0, //행의 구분 너비
              crossAxisSpacing: 4.0, //열의 구분 너비
              childAspectRatio: 2 / 3),
          itemCount: s.length,
          itemBuilder: (ctx, index) {
            return Container(
              color: Colors.green[100],
              child: Center(
                child: Text('${s[index]}'),
              ),
            );
          }),
    );
  }
}
