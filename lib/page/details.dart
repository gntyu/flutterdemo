import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static final String sName = "details";

  @override
  State<StatefulWidget> createState() {
    return new DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,//阴影
        title: new Text("详情"),
        actions: <Widget>[
          _airDress(),
          new Padding(
            padding: EdgeInsets.only(right: 20.0),
          ),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Colors.lightBlue,
            height: 150,
            // child: new TabBar(),
            // constraints: BoxConstraints(maxHeight: 100),
            // margin: EdgeInsets.only(top: 20.0),
          )
        ],
      ),
    );
  }

  Widget _airDress() {
    return new PopupMenuButton(
      child: new Icon(Icons.more_horiz,size: 30.0),
      offset:new Offset(50.0,80.0) ,
      onSelected: (model) {
        print("tap one menu");
        model.selected(model);
      },
      itemBuilder: (BuildContext context) {
        return _renderHeaderPopItemChild();
      },
    );
  }

  _renderHeaderPopItemChild() {
    List<PopupMenuEntry> list = new List();
    list.add(new PopupMenuItem(
        child: new Text("分享"), value: "share", height: 40.0, enabled: true));
    list.add(new PopupMenuItem(
        child: new Text("刷新"), value: "fresh", height: 30.0, enabled: false));
    return list;
  }
}
