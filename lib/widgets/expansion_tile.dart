

import 'package:flutter/material.dart';

class OpenFlutterExpansionTile extends StatelessWidget {
  final String title,description;

  OpenFlutterExpansionTile({Key key,@required this.title,this.description}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(this.title),
      trailing: Icon(Icons.keyboard_arrow_right),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            this.description,
            style: TextStyle(fontSize: 15.0),
          ),
        )
      ],
    );
  }
}
