import 'package:flutter/material.dart';

import '../config/theme.dart';

class RightArrowAction extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const RightArrowAction(this.text, {Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(text),
            Icon(
              Icons.trending_flat,
              color: AppColors.red,
            )
          ],
        ),
      ),
    );
  }
}
