import 'package:flutter/material.dart';
import 'package:flutter_study/AritclePage.dart';
import 'package:flutter_study/AboutPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:  new MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// 相当于 react 的状态机 继承了 State 才可以拿到 setState 的方法 更新状态 
class _MyHomePageState extends State<MyHomePage> {
  // 当前选项卡的 索引
  int _tabIndex=  0;

  // 文章页 和 关于我们
  var _pageList = [
    new AritclePage(),
    new AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('文章')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), title: Text('关于')
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      )
    );
  }
}
