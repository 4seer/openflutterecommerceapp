import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class OpenFlutterInputButton extends StatelessWidget {
  final String placeHolder;
  final VoidCallback onClick;
  final double width;
  final TextEditingController controller;

  const OpenFlutterInputButton(
      {Key key,
      @required this.placeHolder,
      @required this.onClick,
      @required this.width,
      @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      height: 38,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSizes.imageRadius)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lightGray.withOpacity(0.3),
                        blurRadius: AppSizes.imageRadius,
                        offset: Offset(0.0, AppSizes.imageRadius))
                  ]),
              height: 38,
              width: width - 40,
              child: TextField(
                  controller: controller,
                  style: _theme.textTheme.headline5
                      .copyWith(color: _theme.primaryColorLight),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: placeHolder,
                  ))),
          Positioned(
            right: 5,
            child: InkWell(
              onTap: onClick,
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.all(Radius.circular(19)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.lightGray.withOpacity(0.3),
                          blurRadius: AppSizes.imageRadius,
                          offset: Offset(0.0, AppSizes.imageRadius))
                    ]),
                child: Icon(Icons.arrow_forward, color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
