import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int elevate = 0;
  int count=0;

  //toggle button의 4칸짜리 리스트를 생성하고 값을 false로 설정
  List<bool> _selection = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Study'),
          centerTitle: true,
          backgroundColor: Colors.green[400],
          elevation: 1.0,
          toolbarHeight: 70,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        //body부분에 Padding을 위젯을 넣음
        //모든 쪽 20씩 띄우기
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                '<Elevated Button>',
                style: TextStyle(fontSize: 20, letterSpacing: 1.5),
              ),
              SizedBox(
                height: 40, //예쁘게 보이려고 높이 좀 맞춰준 것
              ),
              Row(
                //row이므로 가로축이 주측이 되고
                //mainAxisAlignment를 통해 가운데 정렬
                mainAxisAlignment:
                    MainAxisAlignment.center, //그래서 원래 있던 문구가 가운데로 오게 된 것
                children: [
                  ElevatedButton(
                    //클릭시 elevate 변수의 값 +1
                    onPressed: () {
                      setState(() {
                        elevate += 1;
                      });
                    },
                    child: Text('+'),
                    //버튼의 스타일을 바꾸기 위해 하는 일
                    style: ElevatedButton.styleFrom(
                        //primary는 버튼 색, onPrimary는 글씨 색
                        primary: Colors.green,
                        onPrimary: Colors.white),
                  ),
                  SizedBox(
                    width: 40, //열 중에서 너비를 맞춰주기 위해서 사이즈 박스 넣어준 것
                  ),
                  Text(
                    '클릭 횟수: $elevate',
                    style: TextStyle(
                      //텍스트 색상 변경
                      color: Colors.black,
                      fontSize: 20,
                      //문자 사이의 간격
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    //TextButton
                    onPressed: () {},
                    child: Text('TextButton'),
                    style: TextButton.styleFrom(primary: Colors.green),
                  ),
                  SizedBox(width: 30),
                  OutlinedButton(
                      //OutlinedButton
                      onPressed: () {},
                      child: Text('OutlinedButton'),
                      style: OutlinedButton.styleFrom(primary: Colors.green)),
                  SizedBox(width: 30),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm)) //IconButton 알람 아이콘 버튼
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                '<Toggle Button>',
                style: TextStyle(
                    color: Colors.black, fontSize: 20, letterSpacing: 1.5),
              ),
              SizedBox(
                height: 20,
              ),
              ToggleButtons(
                children: [
                  Icon(Icons.arrow_back),
                  Icon(Icons.arrow_upward),
                  Icon(Icons.arrow_forward),
                  Icon(Icons.arrow_downward)
                ],
                isSelected: _selection,
                onPressed: (int index) {
                  setState(() {
                    _selection[index] = !_selection[index];
                  });
                },
              ),
              SizedBox(height: 50),
              Text('<FloatingAction Button>',
              style:TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 1.5),
              ),
              SizedBox(height: 20),
              FloatingActionButton( //Column 안에 껴 있어서! 밖으로 뺴줘야함!
                child:Icon(Icons.add),
                backgroundColor:Colors.blueGrey,
                onPressed:(){
                  setState(() {
                    count++;
                  });
                }),
              // SizedBox(height: 50),
              // ElevatedButton( //Column 안에 껴 있어서! 밖으로 뺴줘야함!
              //   child:Icon(Icons.forward),
              //   style: ElevatedButton.styleFrom(primary: Colors.green[300]),
              //   onPressed:(){
              //     Fluttertoast.showToast(
              //       msg:"버튼을 누른 횟수: $count",
              //       toastLength:Toast.LENGTH_SHORT,
              //       gravity:ToastGravity.BOTTOM,
              //       backgroundColor:Colors.grey[300],
              //       textColor:Colors.black);
                  
              //   })

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        backgroundColor:Colors.blueGrey,
        onPressed:(){
          setState(() {
            count++;
          });
        }),
      ),
    );
  }
}
