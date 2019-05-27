import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils/NavigatorUtils.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    // Store<GSYState> store = StoreProvider.of(context);
    // CommonUtils.initStatusBarHeight(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      // UserDao.initUserInfo(store).then((res) {
        // if (res != null && res.result) {
        NavigatorUtils.goHome(context);
        // } else {
        //   NavigatorUtils.goLogin(context);
        // }
        return true;
      // });
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Text("welcome...",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0));
    //   return StoreBuilder<GSYState>(
    //     builder: (context, store) {
    //       double size = 200;
    //       return new Container(
    //         color: Color(GSYColors.white),
    //         child: Stack(
    //           children: <Widget>[
    //             new Center(
    //               child: new Image(
    //                   image: new AssetImage('static/images/welcome.png')),
    //             ),
    //             new Align(
    //               alignment: Alignment.bottomCenter,
    //               child: new Container(
    //                 width: size,
    //                 height: size,
    //                 color: Colors.white,
    //                 child: LottieView.fromFile(
    //                   filePath: "static/file/rejection2.json",
    //                   autoPlay: true,
    //                   loop: true,
    //                   reverse: false,
    //                   onViewCreated: onViewCreatedFile,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   );
  }
}
