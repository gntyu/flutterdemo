import 'package:flutter/material.dart';
import 'package:flutterdemo/common/model/User.dart';
import 'package:flutterdemo/common/redux/middleware/epic_middleware.dart';
import 'package:flutterdemo/common/redux/user_redux.dart';
import 'package:redux/redux.dart';



///全局Redux store 的对象，保存State数据
class GSYState {
  ///用户信息
  User userInfo;

  ///构造方法
  GSYState({this.userInfo});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
GSYState appReducer(GSYState state, action) {
  return GSYState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),

  );
}



final List<Middleware<GSYState>> middleware = [
  EpicMiddleware<GSYState>(UserInfoEpic()),
  UserInfoMiddleware(),
];