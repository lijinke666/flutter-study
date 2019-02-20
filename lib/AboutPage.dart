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
          children: <Widget>[_avatar(context), _userInfo()],
        ));
  }

  Widget _avatar(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: AssetImage("assets/images/my.png"),
      ),
      margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      decoration: BoxDecoration(
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

  Widget _userInfo() {
    return SizedBox(
      height: 330,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('李金珂', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('喜欢 React 和 Nodejs 的 前端搬砖工'),
              leading: Icon(
                Icons.supervised_user_circle,
                color: Colors.green[500],
              ),
            ),
            Divider(),
            ListTile(
              title:
                  Text('GITHUB', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('https://github.com/lijinke666'),
              leading: Icon(
                Icons.dvr,
                color: Colors.green[500],
              ),
            ),
            Divider(),
            ListTile(
              title:
                  Text('联系方式', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('jkli@thoughtworks.com'),
              leading: Icon(
                Icons.email,
                color: Colors.green[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('关于'),
              leading: Icon(
                Icons.verified_user,
                color: Colors.green[500],
              ),
              onTap: () {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('李金珂的小屋'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('version: v0.0.1'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('知道了'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
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

  void showAboutDialog({
    @required BuildContext context,
    String applicationName,
    String applicationVersion,
    Widget applicationIcon,
    String applicationLegalese,
    List<Widget> children,
  }) {
    assert(context != null);
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: applicationName,
            applicationVersion: applicationVersion,
            applicationIcon: applicationIcon,
            applicationLegalese: applicationLegalese,
            children: children,
          );
        });
  }
}
