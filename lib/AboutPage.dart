import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}


class Page extends State<AboutPage> {
  @override
  Widget build(BuildContext context){
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('关于')),
      body: aboutContent(context)
    );
  }

    // 文章列表
  Widget aboutContent(BuildContext context) {
    return new Text('关于');
  }
}