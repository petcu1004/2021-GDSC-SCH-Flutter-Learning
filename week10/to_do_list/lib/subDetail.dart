import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  _SubDetailState createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = new List.empty(growable: true);

  void initState() {
    super.initState();
    todoList.add('장 보기');
    todoList.add('약 사오기');
    todoList.add('방 대청소');
    todoList.add('런닝 1시간');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async{
    final result=await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }


}
