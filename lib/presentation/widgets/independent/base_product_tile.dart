import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class BaseProductTile extends StatelessWidget {
  final VoidCallback onClick;
  final String inactiveMessage;
  final Widget bottomRoundButton;
  final ImageProvider image;
  final WidgetBuilder mainContentBuilder;
  final String specialMark;
  final VoidCallback onRemove;
  final double imageHeight;
  final double imageWidth;
  final double tileHeight;

  const BaseProductTile(
      {Key key,
      this.onClick,
      this.inactiveMessage,
      this.bottomRoundButton,
      this.image,
      this.mainContentBuilder,
      this.imageHeight = 184,
      this.imageWidth = AppSizes.tile_width,
      this.tileHeight = AppSizes.tile_height,
      this.specialMark,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth + AppSizes.widgetSidePadding,
      height: tileHeight,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.widgetSidePadding / 2),
      child: Opacity(
        opacity: inactiveMessage == null ? 1 : 0.6,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: onClick,
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                    ),
                    child: Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: image, fit: BoxFit.cover),
                        color: AppColors.background,
                        borderRadius:
                            BorderRadius.circular(AppSizes.imageRadius),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: mainContentBuilder(context),
                  ),
                  inactiveMessage == null ? Container() : Text(inactiveMessage),
                ],
              ),
            ),
            bottomRoundButton == null
                ? Container()
                : Positioned(
                    top: imageHeight - 24,
                    right: 0,
                    child: bottomRoundButton,
                  ),
            specialMark == null
                ? Container()
                : Positioned(
                    left: 4,
                    top: 6,
                    child: Container(
                        padding: EdgeInsets.all(AppSizes.linePadding * 1.5),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.imageRadius),
                          color: specialMark == 'New'
                              ? AppColors.red
                              : AppColors.black,
                        ),
                        child: Text(specialMark,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold))),
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
