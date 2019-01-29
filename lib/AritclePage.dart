import 'package:flutter/material.dart';

class AritclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}


class Page extends State<AritclePage> {
  @override
  Widget build(BuildContext context){
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('文章')),
      body: articleList(context)
    );
  }

  // 文章列表
  Widget articleList(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Text('李金珂'),
        Text('李金珂'),
        Text('李金珂'),
        Text('李金珂'),
      ],
    );
  }
}