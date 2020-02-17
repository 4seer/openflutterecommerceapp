import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/widgets/clickable_line.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class OpenFlutterSortBy extends StatelessWidget {
  final Function(SortBy) onSelect;
  final SortBy currentSortBy;

  const OpenFlutterSortBy({Key key, this.onSelect, this.currentSortBy}) : super(key: key);

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
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.widgetBorderRadius),
              topRight: Radius.circular(AppSizes.widgetBorderRadius),
            )
          ), 
          height: 400,
          width: fullWidth,
          child: Column(children: <Widget>[
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
            Container(
              padding: EdgeInsets.only(top: AppSizes.sidePadding),
              child:  Column(
                children:buildSortBy(fullWidth, _theme)
              )
            )
          ],
        ),
      )
    ) ;
  }

  List<Widget> buildSortBy(double width, ThemeData _theme){
    List<String> sortByVariantTitles = ["Popular", "Newest", "Customer Review","Price: lowest to hight", "Price: highest to low"];
    List<SortBy> sortByVariants = [SortBy.Popular, SortBy.Newest, SortBy.CustomerReview, SortBy.PriceLowestToHigh, SortBy.PriceHighestToLow];
    List<Widget> widgets = List<Widget>();
    for(int i = 0; i< sortByVariants.length && i < sortByVariantTitles.length; i++){
      widgets.add(
        OpenFlutterClickableLine(
          height: 58,
          width: width,
          title: sortByVariantTitles[i],
          sortBy: sortByVariants[i],
          backgroundColor: sortByVariants[i] == currentSortBy ? 
            _theme.accentColor : null,
          textColor: sortByVariants[i] == currentSortBy ? 
            AppColors.white : null,
          onTap: ( (SortBy newSortBy) => { 
            this.onSelect(sortByVariants[i])
          })
        )
      );
    }
    return widgets;
  }
}