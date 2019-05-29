import 'package:flutter/material.dart';

class LYCard extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new LYCardState();
  }
}

class LYCardState extends State<LYCard>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,width: 1.0,),
        borderRadius: new BorderRadius.circular((10.0)), // 圆角度
      ),
      child: new Padding(
        padding: EdgeInsets.all(10.0),
        child:new Column(
          children:<Widget>[
            new Container(
              child:new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Text("昨日消耗"),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        new Text("1,345",style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
                        new Padding(padding: EdgeInsets.only(right: 3.0)),
                        new Text("万",style: TextStyle(fontSize: 16.0,color: Colors.lightBlue),),
                      ],
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Text("昨日现金"),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Text("971.7",style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
                        new Padding(padding: EdgeInsets.only(right: 3.0)),
                        new Text("万",style: TextStyle(fontSize: 16.0,color: Colors.lightBlue),),
                      ],
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Text("R值"),
                    new Text("56%",style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            new Divider(height: 1.0,indent: 0.0,color: Colors.grey),
            new Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Container(
                  child:new Row(
                    children:<Widget>[
                      new Text("消耗环比"),
                      new Icon(Icons.arrow_drop_up,color: Colors.red),
                      new Text("5.8%"),
                    ]
                  )
                ),
                new Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.3,color: Colors.grey),
                  ),
                  height: 30.0,
                ),
                new Container(
                  child:new Row(
                    children:<Widget>[
                      new Text("现金环比"),
                      new Icon(Icons.arrow_drop_down,color: Colors.green),
                      new Text("3.1%"),
                    ]
                  )
                )
              ],
            )
        ]
      ),
      )
    );
  }
}