import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/category.dart';

import 'block_subtitle.dart';

class OpenFlutterSelectValuesBoxes<T> extends StatelessWidget {
  final List<T> availableValues;
  final List<T> selectedValues;
  final String label;
  final Function(List<T>) onClick;
  final double boxWidth;

  const OpenFlutterSelectValuesBoxes({Key key, 
    @required this.availableValues, 
    @required this.selectedValues, 
    @required this.label, 
    @required this.onClick, this.boxWidth}) : super(key: key);

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
                width: width,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding*2),
                child:Wrap(
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
    for(int i = 0; i < availableValues.length; i++){
      colorWidgets.add(
        Padding(
          padding: EdgeInsets.only(right: AppSizes.sidePadding),
          child: InkWell(
            onTap: ( () => {
              updateSelectedSizes(availableValues[i])
            }), 
            child: buildBoxWidget(availableValues[i], context)
          )
        )
      );
    }
    return colorWidgets;
  }

  buildBoxWidget(T currentValue, BuildContext context){
    ThemeData _theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: boxWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: 
          Border.all(
            color:  selectedValues.contains(currentValue) ? 
              _theme.accentColor
              : _theme.primaryColorLight
          ),
        color: selectedValues.contains(currentValue) ? 
          _theme.accentColor
          : AppColors.white
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.sidePadding,
        horizontal: boxWidth == null? AppSizes.sidePadding : 0),
      child: Text(convertValueToString(currentValue).toUpperCase(),
        overflow: TextOverflow.ellipsis,
        style: _theme.textTheme.headline5.copyWith(
          color: selectedValues.contains(currentValue) ? 
            AppColors.white
            : _theme.accentColor,
        ))
    );
  }

  convertValueToString(T currentValue){
    if ( currentValue is Category)
      return currentValue.title;
    return currentValue;
  }

  updateSelectedSizes(T currentValue){
    if ( selectedValues != null ) {
      if ( selectedValues.contains(currentValue))
        selectedValues.remove(currentValue);
      else 
        selectedValues.add(currentValue);
    }
    this.onClick(this.selectedValues);
  }

}