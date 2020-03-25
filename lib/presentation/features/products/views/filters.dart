import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/fake_model/models/predefined_attributes.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../products.dart';

class ProductFilterView extends StatefulWidget {
  final Function changeView;

  const ProductFilterView({Key key, this.changeView}) : super(key: key);

  @override
  _ProductFilterViewState createState() => _ProductFilterViewState();
}

class _ProductFilterViewState extends State<ProductFilterView> {
  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<ProductsBloc>(context);
    var _theme = Theme.of(context);
    return BlocListener<ProductsBloc, ProductState>(listener: (context, state) {
      if (state is ProductsErrorState) {
        return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
                style: _theme.textTheme.display1
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child:
        BlocBuilder<ProductsBloc, ProductState>(builder: (context, state) {
      if (state is ProductsReadyState) {
        return Stack(children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            OpenFlutterPriceRangeSlider(
              min: 0,
              max: 300,
              start: state.filterRules.selectedPriceRange.minPrice,
              end: state.filterRules.selectedPriceRange.maxPrice,
              label: 'Price range',
              onChanged: ((RangeValues values) => {
                    bloc.add(ProductChangeFilterRulesEvent(state.filterRules
                        .copyWithPriceRange(
                            PriceRange(values.start, values.end))))
                  }),
            ),
            /*OpenFlutterColorSelect(
              availableColors: state.availableColors,
              selectedColors: state.selectedColors,
              onClick: ((List<Color> newSelectedColors) => {
                    bloc
                      .add(ProductChangeSelectedAttributesEvent(
                          newSelectedColors))
                  }),
              label: 'Colors',
            ),*/
            /*OpenFlutterSelectValuesBoxes<String>(
              availableValues: state.availableSizes,
              selectedValues: state.selectedSizes,
              boxWidth: 50,
              label: 'Sizes',
              onClick: ((List<String> newSelectedValues) => {
                    bloc
                      .add(ProductChangeSelectedSizesEvent(newSelectedValues))
                  }),
            ),*/
            OpenFlutterSelectValuesBoxes<Category>(
              boxWidth: 70,
              availableValues:
                  state.filterRules.categories.keys.toList(growable: false),
              selectedValues: state.filterRules.categories.entries
                  .where((mapEntry) => mapEntry.value)
                  .map((mapEntry) => mapEntry.key)
                  .toList(growable: false),
              label: 'Categories',
              onClick: ((List<Category> newSelectedValues) => {
                    bloc.add(ProductChangeFilterRulesEvent(
                        state.filterRules)) //TODO update
                  }),
            ),
            /*OpenFlutterTextTile(
                title: 'Brand',
                subtitle:
                    getBrandList(state.availableBrands, state.selectedBrandIds),
                // 'adidas Originals, Jack & Jones, s.Oliver',
                onClick: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 3)
                    }))*/
          ])),
          Positioned(
            bottom: 0,
            child: Container(
                width: fullWidth,
                child: Row(
                  children: <Widget>[
                    OpenFlutterButton(
                      width: (fullWidth - AppSizes.sidePadding * 5) / 2,
                      onPressed: (() => {
                            widget.changeView(
                                changeType: ViewChangeType.Exact, index: 0)
                          }),
                      title: 'Discard',
                      textColor: _theme.primaryColor,
                      backgroundColor: AppColors.white,
                      borderColor: _theme.primaryColor,
                    ),
                    OpenFlutterButton(
                      width: (fullWidth - AppSizes.sidePadding * 5) / 2,
                      onPressed: (() => {
                            widget.changeView(
                                changeType: ViewChangeType.Exact, index: 0)
                          }),
                      title: 'Apply',
                    ),
                  ],
                )),
          )
        ]);
      }

      return Container();
    }));
  }

  String getBrandList(List<Brand> availableBrands, List<int> selectedBrandIds) {
    var concatenate = '';

    availableBrands.forEach((Brand item) {
      var maxCharacters = 70;
      if (concatenate.length < maxCharacters) {
        if (selectedBrandIds.isEmpty || selectedBrandIds.contains(item.id)) {
          concatenate += (concatenate.isNotEmpty ? ', ' : '') + item.name;
        }
      }
    });

    return concatenate;
  }
}
