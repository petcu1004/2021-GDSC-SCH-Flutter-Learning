import 'package:flutter/cupertino.dart';

class CupertinoFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('홈'),
        ),
        child: Container(
          child: Center(
            child: Text('첫 번째 페이지'),
          ),
        ));
  }
}
