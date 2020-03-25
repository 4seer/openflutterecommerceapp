import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/search_bar.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import '../../wrapper.dart';
import '../products.dart';

class SelectBrandView extends StatefulWidget {
  final Function changeView;

  const SelectBrandView({Key key, this.changeView}) : super(key: key);

  @override
  _SelectBrandViewState createState() => _SelectBrandViewState();
}

class _SelectBrandViewState extends State<SelectBrandView> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var fullWidth = MediaQuery.of(context).size.width;
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
        return _buildViewByLoadedState(context, state, fullWidth, _theme);
      }

      return Container();
    }));
  }

  Stack _buildViewByLoadedState(BuildContext context, ProductsReadyState state,
      double fullWidth, ThemeData _theme) {
    var width = MediaQuery.of(context).size.width;
    ProductAttribute brandAttribute = state.filterRules.selectedAttributes.keys
        .firstWhere((attribute) => attribute.name == 'Brand');
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: OpenFlutterSearchBar(
              searchKey: '', //TODO make brands be attributes
              onChange: ((String text) => BlocProvider.of<ProductsBloc>(context)
                  .add(SearchEvent(text))),
            ),
          ),
          brandAttribute == null
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: AppSizes.sidePadding * 1.5),
                  child: Column(
                    children: buildBranCheckboxList(
                        state,
                        brandAttribute,
                        state.filterRules.selectedAttributes[brandAttribute],
                        width),
                  ),
                )
        ]),
      ),
      Positioned(
        bottom: 0,
        child: Container(
            width: fullWidth,
            child: Row(
              children: <Widget>[
                OpenFlutterButton(
                  width: (fullWidth - AppSizes.sidePadding * 5) / 2,
                  onPressed: (() =>
                      {widget.changeView(changeType: ViewChangeType.Backward)}),
                  title: 'Discard',
                  textColor: _theme.primaryColor,
                  backgroundColor: AppColors.white,
                  borderColor: _theme.primaryColor,
                ),
                OpenFlutterButton(
                  width: (fullWidth - AppSizes.sidePadding * 5) / 2,
                  onPressed: (() =>
                      {widget.changeView(changeType: ViewChangeType.Backward)}),
                  title: 'Apply',
                ),
              ],
            )),
      ),
    ]);
  }

  List<Widget> buildBranCheckboxList(
    ProductsReadyState state,
    ProductAttribute brandAttribute,
    List<String> selectedBrands,
    double width,
  ) {
    return brandAttribute.options
        .map((brand) => OpenFlutterLabelRightCheckbox(
              width: width - AppSizes.sidePadding * 2,
              checked: selectedBrands.contains(brand),
              title: brand,
              onChanged: ((bool value) {
                if (value) {
                  BlocProvider.of<ProductsBloc>(context).add(
                      ProductChangeFilterRulesEvent(state.filterRules
                          .copyWithAdditionalAttribute(brandAttribute, brand)));
                } else {
                  BlocProvider.of<ProductsBloc>(context).add(
                      ProductChangeFilterRulesEvent(state.filterRules
                          .copyWithRemovedAttributeValue(
                              brandAttribute, brand)));
                }
              }),
            ))
        .toList(growable: false);
  }
}
