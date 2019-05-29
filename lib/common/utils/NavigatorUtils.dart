
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/page/home.dart';
import 'package:flutterdemo/page/profile.dart';
import 'package:flutterdemo/page/details.dart';


class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  //路由跳转
  static pushCupertino(BuildContext context, Widget widget) {
    return Navigator.push(
        context, new CupertinoPageRoute(builder: (context) => widget));
  }

  //路由跳转
  static pushMaterial(BuildContext context, Widget widget) {
    return Navigator.push(
        context, new MaterialPageRoute(builder: (context) => widget));
  }

  //主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  //个人信息
  static goProfile(BuildContext context) {
    pushCupertino(context, new ProfilePage());
  }

  //详情
  static goProfileDetails(BuildContext context) {
    pushMaterial(context, new DetailsPage());
  }

  ///登录页
  // static goLogin(BuildContext context) {
  //   Navigator.pushReplacementNamed(context, LoginPage.sName);
  // }

  ///个人中心
  // static goPerson(BuildContext context, String userName) {
  //   NavigatorRouter(context, new PersonPage(userName));
  // }


  ///通用列表
  // static gotoCommonList(
  //     BuildContext context, String title, String showType, String dataType,
  //     {String userName, String reposName}) {
  //   NavigatorRouter(
  //       context,
  //       new CommonListPage(
  //         title,
  //         showType,
  //         dataType,
  //         userName: userName,
  //         reposName: reposName,
  //       ));
  // }


}
