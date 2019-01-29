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
      // body: articleList(context)
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text('最新')),
                Tab(child: Text('最热')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              articleList(context),
              articleList(context),
            ],
          ),
        ),
      ),
    );
  }

  // 文章列表
  Widget articleList(BuildContext context) {
    return ListView(
      children: <Widget>[
        articleCard(context),
        articleCard(context),
        articleCard(context),
      ],
    );
  }

  //单个文章
  Widget articleCard(BuildContext context){
    return Container(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "文章标题",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Container(child: 
            Text(
              "文章内容",
              style: TextStyle (
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.supervised_user_circle),
              Icon(Icons.supervised_user_circle),
              Icon(Icons.supervised_user_circle),
            ],
          )
        ],
      ),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}