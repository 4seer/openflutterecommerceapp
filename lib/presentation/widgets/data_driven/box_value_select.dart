import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';

import '../independent/block_subtitle.dart';

class OpenFlutterSelectValuesBoxes<T> extends StatefulWidget {
  final List<T> availableValues;
  final List<T> selectedValues;
  final String label;
  final Function(List<T>) onClick;
  final double boxWidth;

  const OpenFlutterSelectValuesBoxes(
      {Key key,
      @required this.availableValues,
      @required this.selectedValues,
      @required this.label,
      @required this.onClick,
      this.boxWidth})
      : super(key: key);

  @override
  _OpenFlutterSelectValuesBoxesState<T> createState() =>
      _OpenFlutterSelectValuesBoxesState<T>();
}

class _OpenFlutterSelectValuesBoxesState<T>
    extends State<OpenFlutterSelectValuesBoxes<T>> {
  List<T> selectedValues;

  @override
  void initState() {
    selectedValues = widget.selectedValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: <Widget>[
      OpenFlutterBlockSubtitle(title: widget.label, width: width),
      Padding(
        padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: AppSizes.sidePadding),
          color: AppColors.white,
          child: Column(children: <Widget>[
            Container(
              width: width,
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.sidePadding * 2),
              child: Wrap(children: buildSelectBoxes(context)),
            )
          ]))
    ]);
  }

  List<Widget> buildSelectBoxes(BuildContext context) {
    var colorWidgets = <Widget>[];
    for (var i = 0; i < widget.availableValues.length; i++) {
      colorWidgets.add(
        Padding(
          padding: EdgeInsets.only(right: AppSizes.sidePadding),
          child: InkWell(
            onTap: (() => {updateSelectedBoxes(widget.availableValues[i])}),
            child: buildBoxWidget(widget.availableValues[i], context),
          ),
        ),
      );
    }
    return colorWidgets;
  }

  Container buildBoxWidget(T currentValue, BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: widget.boxWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
              color: widget.selectedValues.contains(currentValue)
                  ? _theme.accentColor
                  : _theme.primaryColorLight),
          color: widget.selectedValues.contains(currentValue)
              ? _theme.accentColor
              : AppColors.white),
      padding: EdgeInsets.symmetric(
          vertical: AppSizes.sidePadding,
          horizontal: widget.boxWidth == null ? AppSizes.sidePadding : 0),
      child: Text(
        convertValueToString(currentValue).toUpperCase(),
        overflow: TextOverflow.ellipsis,
        style: _theme.textTheme.display3.copyWith(
          color: widget.selectedValues.contains(currentValue)
              ? AppColors.white
              : _theme.accentColor,
        ),
      ),
    );
  }

  String convertValueToString(T currentValue) {
    if (currentValue is CategoryView) return currentValue.title;
    if (currentValue is Category) {
      return currentValue.name;
    }
    return currentValue.toString();
  }

  void updateSelectedBoxes(T currentValue) {
    if (selectedValues != null) {
      if (selectedValues.contains(currentValue)) {
        selectedValues.remove(currentValue);
      } else {
        selectedValues.add(currentValue);
      }
    }
    setState(() {});
    widget.onClick(selectedValues);
  }
}

class CategoryView {
  final String title;

  CategoryView(this.title);
}
