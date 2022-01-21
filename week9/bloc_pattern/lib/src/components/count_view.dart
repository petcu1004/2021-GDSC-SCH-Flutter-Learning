//count에 변화를 UI에 뿌려주는 코드

import 'package:bloc_pattern/src/ui/bloc_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//count만을 보여주는 코드
class CountView extends StatelessWidget {
  const CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      //비동기처리 (StreamBuilder :변화되는 값을 계속해서 감지)
      //StreamBuilder를 통해 countBloc.count을 감지
      child: StreamBuilder(
        stream: countBloc.count, //countBloc.count => _countSubject.stream을 구독중
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //AsyncSnapshot을 통해 들어온 snapshot을 UI에 뿌려준다.
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 80),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
