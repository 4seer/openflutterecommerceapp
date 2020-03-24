import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/category.dart';
import 'package:openflutterecommerce/data/fake_model/models/brand.dart';
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
                style: OpenFlutterEcommerceTheme.TEXT_HEADLINE3
                    .copyWith(color: _theme.errorColor)));
      }
      return Container();
    }, child:
        BlocBuilder<ProductsBloc, ProductState>(builder: (context, state) {
      if (state is ProductsLoadedState) {
        return Stack(children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            OpenFlutterPriceRangeSlider(
              min: 0,
              max: 300,
              start: state.priceRange.start,
              end: state.priceRange.end,
              label: 'Price range',
              onChanged: ((RangeValues values) =>
                  {bloc..add(ProductChangePriceRangeEvent(values))}),
            ),
            OpenFlutterColorSelect(
              key: UniqueKey(),
              availableColors: state.availableColors,
              selectedColors: state.selectedColors,
              onClick: ((List<Color> newSelectedColors) => {
                    bloc
                      ..add(ProductChangeSelectedColorsEvent(newSelectedColors))
                  }),
              label: 'Colors',
            ),
            OpenFlutterSelectValuesBoxes<String>(
              availableValues: state.availableSizes,
              selectedValues: state.selectedSizes,
              boxWidth: 50,
              label: 'Sizes',
              onClick: ((List<String> newSelectedValues) => {
                    bloc
                      ..add(ProductChangeSelectedSizesEvent(newSelectedValues))
                  }),
            ),
            OpenFlutterSelectValuesBoxes<Category>(
              boxWidth: 70,
              availableValues: state.availableCategories,
              selectedValues: state.selectedCategories,
              label: 'Categories',
              onClick: ((List<Category> newSelectedValues) => {
                    bloc.add(
                        ProductChangeSelectedCategoriesEvent(newSelectedValues))
                  }),
            ),
            OpenFlutterTextTile(
                title: 'Brand',
                subtitle:
                    getBrandList(state.availableBrands, state.selectedBrandIds),
                // 'adidas Originals, Jack & Jones, s.Oliver',
                onClick: (() => {
                      widget.changeView(
                          changeType: ViewChangeType.Exact, index: 3)
                    }))
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
          concatenate += (concatenate.isNotEmpty ? ', ' : '') + item.title;
        }
      }
    });

    return concatenate;
  }
}
