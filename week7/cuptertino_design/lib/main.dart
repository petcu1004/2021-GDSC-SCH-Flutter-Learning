import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'iosSub/cupertinoFirstPage.dart';
import 'iosSub/cupertinoSecondPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: CupertinoMain(),
    );
  }
}

class CupertinoMain extends StatefulWidget {
  @override
  _CupertinoMain createState() => _CupertinoMain();
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;


  void initState(){
    super.initState();
    tabBar=CupertinoTabBar(items:<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ],
    activeColor: Colors.pink);
    
  }

Widget build(BuildContext context){
  return CupertinoApp(home: CupertinoTabScaffold(tabBar: tabBar!, tabBuilder: (context, value){
    if(value==0){
      return CupertinoFirstPage();
    }else{
      return CupertinoSecondPage();
    }
  }),
  );
} 
}