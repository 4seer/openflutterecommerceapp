import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class BaseProductListItem extends StatelessWidget {
  final VoidCallback onClick;
  final String inactiveMessage;
  final Widget bottomRoundButton;
  final ImageProvider image;
  final WidgetBuilder mainContentBuilder;
  final String specialMark;
  final VoidCallback onRemove;
  final double imageHeight;
  final double imageWidth;

  const BaseProductListItem(
      {Key key,
      this.onClick,
      this.inactiveMessage,
      this.bottomRoundButton,
      this.image,
      this.mainContentBuilder,
      this.imageHeight = 125,
      this.imageWidth = 125,
      this.specialMark,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: imageHeight + 30,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding / 2),
      child: Opacity(
        opacity: inactiveMessage == null ? 1 : 0.6,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: onClick,
              child: Container(
                height: imageHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: imageWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          image: image == null ? null : DecorationImage(image: image, fit: BoxFit.cover),
                          color: AppColors.background,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.imageRadius),
                            bottomLeft: Radius.circular(AppSizes.imageRadius),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(11.0),
                          child: mainContentBuilder(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomRoundButton == null
                ? Container()
                : Positioned(
                    top: imageHeight - 32,
                    right: 0,
                    child: bottomRoundButton,
                  ),
            inactiveMessage == null
                ? Container()
                : Positioned(
                    top: imageHeight + 4,
                    left: 0,
                    child: Text(inactiveMessage),
                  ),
            specialMark == null
                ? Container()
                : Positioned(
                    left: 4,
                    top: 6,
                    child: Container(
                        padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                          color: specialMark == 'New' ? AppColors.red : AppColors.black,
                        ),
                        child: Text(specialMark,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: AppColors.white, fontWeight: FontWeight.bold))),
                  ),
            onRemove == null
                ? Container()
                : Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.lightGray,
                      onPressed: onRemove,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
