import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/fake_model/models/brand.dart';
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
    final bloc = BlocProvider.of<ProductsBloc>(context);
    var fullWidth = MediaQuery.of(context).size.width;
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
        return _buildViewByLoadedState(context, state, bloc, fullWidth, _theme);
      }

      return Container();
    }));
  }

  Stack _buildViewByLoadedState(BuildContext context, ProductsLoadedState state,
      ProductsBloc bloc, double fullWidth, ThemeData _theme) {
    var width = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: OpenFlutterSearchBar(
              searchKey: state.brandSearchKey,
              onChange: ((String text) =>
                  {bloc..add(ProductChangeBrandSearchKeyEvent(text))}),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: AppSizes.sidePadding * 1.5),
              child: Column(
                  children: buildBranCheckboxList(
                      state.availableBrands,
                      state.selectedBrandIds,
                      state.brandSearchKey,
                      width,
                      bloc)))
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
      List<Brand> brands,
      List<int> selectedBrandIds,
      String searchKeyFilter,
      double width,
      ProductsBloc bloc) {
    var checkboxes = <Widget>[];
    for (var i = 0; i < brands.length; i++) {
      if (searchKeyFilter != null &&
          brands[i]
              .title
              .toLowerCase()
              .contains(searchKeyFilter.toLowerCase())) {
        var selected =
            selectedBrandIds != null && selectedBrandIds.contains(brands[i].id);
        checkboxes.add(
          OpenFlutterLabelRightCheckbox(
            width: width - AppSizes.sidePadding * 2,
            checked: selected,
            title: brands[i].title,
            onChanged: ((bool value) {
              if (value && !selectedBrandIds.contains(brands[i].id)) {
                selectedBrandIds.insert(selectedBrandIds.length, brands[i].id);
              } else {
                selectedBrandIds.remove(brands[i].id);
              }
              bloc..add(ProductChangeSelectedBrandsEvent(selectedBrandIds));
            }),
          ),
        );
      }
    }
    return checkboxes;
  }
}
