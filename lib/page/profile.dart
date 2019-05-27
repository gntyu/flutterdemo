// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static final String sName = "profile";

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return new Text(
      "profile page"
    );
  }
}
