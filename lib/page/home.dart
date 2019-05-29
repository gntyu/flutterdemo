import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/page/name.dart';
import 'package:flutterdemo/page/profile.dart';
import 'package:flutterdemo/page/customer.dart';
import 'package:flutterdemo/widget/ly_tabbar_widget.dart';
import 'package:flutterdemo/common/style/ly_style.dart';

class HomePage extends StatelessWidget {
  static final String sName = "home";

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    if (Platform.isAndroid) {
      // AndroidIntent intent = AndroidIntent(
      //   action: 'android.intent.action.MAIN',
      //   category: "android.intent.category.HOME",
      // );
      // await intent.launch();
    }

    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(LYICons.HOME, "name"),
      _renderTab(LYICons.MORE, "customer"),
      _renderTab(LYICons.SEARCH, "profile"),
    ];
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new LYTabBarWidget(
        // drawer: new HomeDrawer(),
        // type: LYTabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new NamePage(),
          new CustomerPage(),
          new ProfilePage(),
        ],
        title:new Text("global")
        // backgroundColor: LYColors.primarySwatch,
        // indicatorColor: Color(LYColors.white),
        // title: LYTitleBar(
        //   LYLocalizations.of(context).currentLocalized.app_name,
        //   iconData: LYICons.MAIN_SEARCH,
        //   needRightLocalIcon: true,
        //   onPressed: () {
        //     NavigatorUtils.goSearchPage(context);
        //   },
      ),
    );
  }
}
