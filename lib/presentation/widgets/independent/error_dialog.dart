import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openflutterecommerce/config/theme.dart';

class ErrorDialog extends StatelessWidget {
  final String mainText;

  const ErrorDialog({Key key, this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(18.0),
              child: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: AppColors.red,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(mainText,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Theme.of(context).errorColor)),
          ),
          SizedBox(
            height: 12.0,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OK',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future showErrorDialog(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(top: 10.0),
              content: ErrorDialog(
                mainText: text,
              ));
        });
  }
}
