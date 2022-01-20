import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Study',
            style: TextStyle(color: Colors.grey[200], fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.green,
        ),
        drawer: Drawer( //옆에 창 나오는 화면! 
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/자까4.png'),
                ),
                accountName: Text('민새미'),
                accountEmail: Text('msw4585@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('Chat'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.desktop_mac),
                title: Text('Seats'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $count',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                child: Icon(Icons.forward),
                style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "버튼을 누른 횟수: $count",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[300],
                      textColor: Colors.black);
                })
          ],
        )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              setState(() {
                count++;
              });
            }),
      ),
    );
  }
}
