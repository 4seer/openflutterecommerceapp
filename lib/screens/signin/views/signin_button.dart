import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SignInButton(this.text, {Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
            boxShadow: [
              BoxShadow(
                  color: AppColors.red.withOpacity(0.3),
                  blurRadius: 4.0,
                  offset: Offset(0.0, 5.0)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: InkWell(
                onTap: onPressed,
                child: Text(
                  text,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
