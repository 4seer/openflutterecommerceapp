import 'package:flutter/material.dart';

class OpenFlutterExpansionTile extends StatelessWidget {
  final String title, description;

  OpenFlutterExpansionTile({
    
    required this.title,
    required this.description,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            style: TextStyle(fontSize: 15.0),
          ),
        )
      ],
    );
  }
}
