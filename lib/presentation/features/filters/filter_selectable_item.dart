import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';

class FilterSelectableItem extends StatelessWidget {
  final bool isSelected;
  final String text;

  const FilterSelectableItem(
      {Key key, this.isSelected = false, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
              color: isSelected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColorLight),
          color: isSelected ? Theme.of(context).accentColor : AppColors.white),
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.sidePadding, horizontal: AppSizes.sidePadding),
      child: Text(
        text,
        style: Theme.of(context).textTheme.display3.copyWith(
              color:
                  isSelected ? AppColors.white : Theme.of(context).accentColor,
            ),
      ),
    );
  }
}
