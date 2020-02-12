import 'package:flutter/material.dart';

class SignInTitle extends StatelessWidget {
  final String text;

  const SignInTitle(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: width / 10),
        ));
  }
}
