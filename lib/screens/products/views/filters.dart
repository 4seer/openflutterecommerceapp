import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/widgets/box_value_select.dart';
import 'package:openflutterecommerce/widgets/color_select.dart';
import 'package:openflutterecommerce/widgets/price_slider.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

import '../../wrapper.dart';
import '../products_bloc.dart';
import '../products_event.dart';
import '../products_state.dart';

class ProductFilterView extends StatefulWidget {
  final Function changeView;

  const ProductFilterView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductFilterViewState createState() => _ProductFilterViewState();
}

class _ProductFilterViewState extends State<ProductFilterView> {
  @override
  Widget build(BuildContext context) {
    final double width =
      MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    final double fullWidth = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<ProductBloc>(context);
    ThemeData _theme = Theme.of(context);
    return BlocListener<ProductBloc, ProductState>(listener: (context, state) {
      if (state is ProductsErrorState) {
        return Container(
          padding: EdgeInsets.all(AppSizes.sidePadding),
          child: Text('An error occured',
              style: _theme.textTheme.headline3
                  .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if ( state is ProductsLoadedState ) {

        return Stack (
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  OpenFlutterPriceRangeSlider(
                    min: 0,
                    max: 300,
                    start: state.priceRange.start,
                    end: state.priceRange.end,
                    label: 'Price range',
                    onChanged: ( (RangeValues values) => {
                      bloc..add(ProductChangePriceRangeEvent(values))
                    }),
                  ),
                  OpenFlutterColorSelect(
                    key: UniqueKey(),
                    availableColors: state.availableColors,
                    selectedColors: state.selectedColors,
                    onClick: ((List<Color> newSelectedColors)=>{
                      bloc..add(ProductChangeSelectedColorsEvent(
                        newSelectedColors
                      ))
                    }), 
                    label: 'Colors',
                  ),
                  OpenFlutterSelectValuesBoxes<String>(
                    key: UniqueKey(),
                    availableValues: state.availableSizes, 
                    selectedValues: state.selectedSizes,
                    boxWidth: 50, 
                    label: 'Sizes', 
                    onClick: ( (List<String> newSelectedValues) =>{
                      bloc..add(ProductChangeSelectedSizesEvent(
                        newSelectedValues
                      ))
                    }),
                  ),

                  OpenFlutterSelectValuesBoxes<Category>(
                    key: UniqueKey(),
                    boxWidth: 70, 
                    availableValues: state.availableCatgories, 
                    selectedValues: state.selectedCategories, 
                    label: 'Categories', 
                    onClick: ( (List<Category> newSelectedValues) =>{
                      bloc..add(ProductChangeSelectedCategoriesEvent(
                        newSelectedValues
                      ))
                    }),
                  ),
                ]
              )
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: fullWidth,
                child: Row(
                  children: <Widget>[
                    OpenFlutterButton(
                      width: (fullWidth - AppSizes.sidePadding*5)/2,
                      onPressed: ( () => {
                        widget.changeView(changeType: ViewChangeType.Exact, index: 0)
                      }), 
                      title: 'Discard',
                      textColor: _theme.primaryColor,
                      backgroundColor: AppColors.white,
                      borderColor: _theme.primaryColor,
                    ),
                    OpenFlutterButton(
                      width: (fullWidth - AppSizes.sidePadding*5)/2,
                      onPressed: ( () => {
                        widget.changeView(changeType: ViewChangeType.Exact, index: 0)
                      }), 
                      title: 'Apply',
                    ),
                  ],
                )
              ),
            )
          ]
        );
      }
    })
   );
  }
}