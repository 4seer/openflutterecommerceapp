import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/clickable_line.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class OpenFlutterBottomPopup extends StatelessWidget {
  final Widget child;
  final double height;
  final String title;

  const OpenFlutterBottomPopup({Key key, 
    @required this.child, 
    @required this.height,
    @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double fullWidth = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _theme.dialogBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.widgetBorderRadius),
              topRight: Radius.circular(AppSizes.widgetBorderRadius),
            )
          ), 
          height: height,
          width: fullWidth,
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child:Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.darkGray,
                borderRadius: BorderRadius.circular(AppSizes.imageRadius)
              ), 
            ),
          ),
          Text("Sort by",
            style: _theme.textTheme.headline3
          ),


          Padding(padding: EdgeInsets.only(bottom: AppSizes.sidePadding),),

          child
        ],
      ),
        )
    ) ;
  }
}