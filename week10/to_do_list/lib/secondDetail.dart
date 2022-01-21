import 'package:flutter/material.dart';


class SecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Detail'),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(controller.value.text); //controller.value.text가 할 일 입력한 값
            }, child: Text('Todo 저장하기'),
            ),
          ],)
        ),
      ),
    );
  }
}
