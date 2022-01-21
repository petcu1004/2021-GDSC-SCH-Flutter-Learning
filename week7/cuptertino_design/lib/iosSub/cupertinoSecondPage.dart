import 'package:flutter/cupertino.dart';

class CupertinoSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('더보기'),
        ),
        child: Container(
          child: Center(
            child: Text('두 번째 페이지'),
          ),
        ));
  }
}
