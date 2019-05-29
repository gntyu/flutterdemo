import 'package:flutter/material.dart';
import 'package:flutterdemo/common/utils/HttpUtils.dart';
import 'package:flutterdemo/common/utils/NavigatorUtils.dart';

class ProfilePage extends StatefulWidget {
  static final String sName = "profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List _apis = [];

  @override
  void initState() {
    super.initState();
    _getApis();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, int index) {
          if (index < _apis.length) {
            return new ListTile(
              title: new Text("${index + 1}. ${_apis[index]['path']}"),
              onTap: () {
                NavigatorUtils.goProfileDetails(context);
              },
            );
          }
        });
  }

  void _getApis() async {
    var result = await HttpUtil().post('/lyapi/apilist');
    setState(() {
      _apis = result['data']['list'];
    });
  }
}
