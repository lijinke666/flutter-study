import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: const Text('关于')),
        body: Column(
          children: <Widget>[panel(context)],
        ));
  }

  Widget panel(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.network(
        "https://cdn.lijinke.cn/1387583682387727.jpg",
        fit: BoxFit.cover,
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.red[400],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0.0, 2.0),
            blurRadius: 5.0,
          ),
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0.0, 6.0),
            blurRadius: 20.0,
          ),
        ],
        // 相当于 border-radius: 50%
        shape: BoxShape.circle,
      ),
    );
  }

  // 关于我们
  Widget carousel(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://cdn.lijinke.cn/1533519644263.png",
              fit: BoxFit.cover,
            );
          },
          itemCount: 10,
          autoplay: true,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }
}
