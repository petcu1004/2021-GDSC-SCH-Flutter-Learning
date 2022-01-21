//앱이 실행될 때 표시할 UI

import 'package:cnp_provider/src/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/ui/count_home_widget.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
	
	// CountProvider를 호출, late를 통해 나중에 값을 받음 
  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
		
		// Provider 접근
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(

      appBar: AppBar(
        title: Text("Provider Sample"),
      ),
      body: CountHomeWidget(),// count_home_widget.dart //count만 관리!
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        IconButton(
          icon: Icon(Icons.add),
        onPressed: () {
          _countProvider.add();// 클릭 되었을 때 add()
        },),
        IconButton(icon: Icon(Icons.remove),
        onPressed: () {
          _countProvider.remove();// 클릭 되었을 때 remove()
        },)


      ],),

    );
  }
}