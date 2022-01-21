 import 'package:flutter/material.dart';


class SecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Detail'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/third'); // /second로 뒤돌아 갈 수 없음.
            },
            child: Text('세 번째 페이지로 이동하기'),
          ),
        ),
      ),
    );
  }
}
