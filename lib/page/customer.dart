import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterdemo/widget/ly_card.dart';

class CustomerPage extends StatefulWidget {
  static final String sName = "customer";

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage>
    with SingleTickerProviderStateMixin {

  @override
  TabController _topTabController;

  @override
  void initState() {
    super.initState();
    _topTabController = new TabController(vsync: this, length: 3);
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _topTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [Text("目标"), Text("季度"), Text("昨日")];
    return new Stack(
      children: <Widget>[ 
        new Container(
          height: 150,
          color: Colors.lightBlue,
          child: new TabBar(
            tabs: tabs,
            controller: _topTabController,
            indicatorWeight: 6.0,
            indicatorColor:Colors.white,
            indicatorPadding: EdgeInsets.all(58.0),
            labelColor: Colors.white,
            indicatorSize:TabBarIndicatorSize.label,
            labelStyle: new TextStyle(fontSize: 16.0),
            onTap: (int) => print("tap tab")
          )
        ),
        new Container(
          color: Colors.lightBlue,
          height: 50,
        ),
        new Positioned(
          top:100.0,
          left: 10.0,
          right: 10.0,
          child:new Padding(
            padding: const EdgeInsets.all(8.0), 
            child:Container(
              child: LYCard(),
            )
          ) 
        )
    ]);
  }

}
