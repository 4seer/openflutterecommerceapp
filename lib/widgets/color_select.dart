import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

import 'block_subtitle.dart';

class OpenFlutterColorSelect extends StatelessWidget {
  final List<Color> availableColors;
  final List<Color> selectedColors;
  final String label;
  final Function(List<Color>) onClick;

  const OpenFlutterColorSelect({Key key, 
    @required this.availableColors, 
    @required this.selectedColors, 
    @required this.label, 
    @required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children:<Widget>[
        OpenFlutterBlockSubtitle(
          title: label,
          width: width
        ),
        Padding(padding: EdgeInsets.only(bottom: AppSizes.sidePadding),),
        Container(
          padding: EdgeInsets.symmetric(vertical: AppSizes.sidePadding),
          color: AppColors.white,
          child: Column(
            children:<Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding*2),
                child:Row(
                  children: buildColors(context)
                ),
              )
            ]
          )
        )
      ]
    );
  }
  buildColors(BuildContext context){
    List<Widget> colorWidgets = List<Widget>();
    for(int i = 0; i < availableColors.length; i++){
      colorWidgets.add(
        Padding(
          padding: EdgeInsets.only(right: AppSizes.sidePadding),
          child: InkWell(
            onTap: ( () => {
              updateSelectedColors(availableColors[i])
            }), 
            child: buildColorWidget(availableColors[i], context)
          )
        )
      );
    }
    return colorWidgets;
  }

  buildColorWidget(Color color, BuildContext context){
    ThemeData _theme = Theme.of(context);
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        border: selectedColors.contains(color) ? 
          Border.all(
            color:  _theme.accentColor
          ) : null,

      ),
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          border: Border.all(
            color: _theme.primaryColorLight
          ),
          color: color
        ),
      )
    );
  }

  updateSelectedColors(Color color){
    if ( selectedColors.contains(color))
      selectedColors.remove(color);
    else 
      selectedColors.add(color);
    this.onClick(this.selectedColors);
  }


}