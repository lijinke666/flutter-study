import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 拉取文章列表
Future<List<Article>> fetchArticleList(http.Client client) async {
  final response = await client.get('https://www.lijinke.cn/api/article/lists?pageIndex=1&pageSize=5');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseArticle, response.body);
}

// 转成 json
List<Article> parseArticle(String responseBody) {
  // TODO: 要报错 ?
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

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
              Text('最热')
            ],
          ),
        ),
      ),
    );
  }

  // 文章列表
  Widget articleList(BuildContext context) {
    // 有数据 展示 否则加载 loading 效果
    return FutureBuilder<List<Article>>(
      future: fetchArticleList(http.Client()),
      builder: (context, snapshot){
        print(snapshot);
        if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
      },
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
                color: Colors.black45
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
          ),
          Row(
            children: <Widget>[
              Text('作者'),
              Container(
                child: Text('2018-10-01 09:09:32'),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
              )
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.panorama_fish_eye, size: 18.0, color: Colors.black45),
                      Padding(padding: EdgeInsets.only(left: 5.0)),
                      Text('222'),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Icon(Icons.refresh, size: 18.0, color: Colors.black45),
                      Padding(padding: EdgeInsets.only(left: 5.0)),
                      Text('111'),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Icon(Icons.tab, size: 18.0, color: Colors.black45),
                      Padding(padding: EdgeInsets.only(left: 5.0)),
                      Text('333'),
                    ]
                  ),
                ),
                Container(
                  child: Text('前端代码',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),), 
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color:  Colors.green,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                )
              ]
            ),
            margin: EdgeInsets.only(top: 10.0),
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

class PhotosList extends StatelessWidget {
  final List<Article> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Text(photos[index].title);
      },
    );
  }
}
class Article {
  final String author;
  final List<String> category;
  final int comments;
  final int like;
  final int pageView;
  final String previewContent;
  final String publishDate;
  final String title;
  final String content;

  Article({this.author, this.comments, this.content, this.category, this.like, this.pageView, this.previewContent, this.publishDate, this.title});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      category: json['title'] as List<String>,
      like: json['like'] as int,
      pageView: json['pageView'] as int,
      previewContent: json['previewContent'] as String,
      publishDate: json['publishDate'] as String,
      comments: json['comments'] as int,
    );
  }
}