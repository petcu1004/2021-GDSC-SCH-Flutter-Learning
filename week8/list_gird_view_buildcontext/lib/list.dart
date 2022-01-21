import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  int count = 25;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        controller: controller,
        itemCount: count,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
            onTap: () {},
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(), //item들 사이사이에 구분선이 추가된 방식
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: toTop,
      //   child: Icon(Icons.arrow_upward),
      // ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: toBottom,
        child: Icon(Icons.arrow_downward),
      ),
    );
  }

  void toTop(){ //맨 위로 이동
    final double start=0;
    controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

    void toBottom(){ //맨 위로 이동
    final double end=controller.position.maxScrollExtent;

    controller.animateTo(end, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

}
