import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterRightArrow extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const OpenFlutterRightArrow(this.text, {required this.onClick});

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
