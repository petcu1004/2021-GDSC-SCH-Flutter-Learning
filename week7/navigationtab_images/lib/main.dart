import 'package:flutter/material.dart';

import 'sub/firstPage.dart';
import 'sub/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bottom Navigation App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// SingleTickerProviderStateMixin 클래스는 애니메이션을 처리하기 위한 헬퍼 클래스
// 상속에 포함시키지 않으면 탭바 컨트롤러를 생성할 수 없다.
// mixin은 다중 상속에서 코드를 재사용하기 위한 한 가지 방법으로 with 키워드와 함께 사용
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController controller;

  void initState() {
    super.initState();

    // SingleTickerProviderStateMixin를 상속 받아서
    // vsync에 this 형태로 전달해야 애니메이션이 정상 처리된다.
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() { //addListener()함수를 통해 탭 컨트롤러 상태 확인
      if (!controller.indexIsChanging) {
        print("이전 index, ${controller.previousIndex}");
        print("현재 index, ${controller.index}");
        print("전체 탭 길이, ${controller.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation TabBar'),
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(), SecondApp()], //firstPage, secondePage의 클래스 가져옴.
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
            icon: Icon(
              Icons.looks_one, //아이콘 모습
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller, //컨트롤러 연결
      ),
    );
  }

  //initState 함수의 반대
  //위젯 트리에서 제거되기 전에 호출, 멤버로 갖고 있는 컨트롤러부터 제거
  void dispose(){
    controller.dispose();
    super.dispose();
  }


}
