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
  Widget build(BuildContext context){
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('关于')),
      body: aboutContent(context)
    );
  }

  // 关于我们
  Widget aboutContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.cover,
          );
        },
        itemCount: 10,
        autoplay: true,
        viewportFraction: 0.8,
        scale: 0.9,
      )
    );
  }
}