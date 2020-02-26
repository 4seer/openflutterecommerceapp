import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/brand.dart';
import 'package:openflutterecommerce/widgets/custom_button.dart';
import 'package:openflutterecommerce/widgets/label_right_checkbox.dart';
import 'package:openflutterecommerce/widgets/search_bar.dart';

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
    ThemeData _theme = Theme.of(context);
    final bloc = BlocProvider.of<ProductBloc>(context);
    double fullWidth = MediaQuery.of(context).size.width;
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
        double width = MediaQuery.of(context).size.width;
        return Stack (
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(AppSizes.sidePadding),
                    child: OpenFlutterSearchBar(
                      searchKey: state.brandSearchKey,
                      onChange: ( (String text) => {
                        bloc..add(ProductChangeBrandSearchKeyEvent(text))
                      }),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: AppSizes.sidePadding*1.5),
                    child: Column(
                      children: buildBranCheckboxList(
                        state.availableBrands,
                        state.selectedBrands,
                        width,
                        bloc
                      )
                    )
                  )
                  
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
    }
    )
    );
  }

  buildBranCheckboxList(List<Brand> brands, 
    List<Brand> selectedBrands, 
    double width,
    ProductBloc bloc
  ){
    List<Widget> checkboxes = List<Widget>();
    for(int i = 0; i < brands.length; i++){
      checkboxes.add(
        OpenFlutterLabelRightCheckbox(
          width: width - AppSizes.sidePadding*2,
          checked: false,
          title: brands[i].title,
          onChanged: ((bool value) {
            if ( value )
              selectedBrands.insert(selectedBrands.length, brands[i]);
            else
              selectedBrands.remove(brands[i]);
            bloc..add(ProductChangeSelectedBrandsEvent(
              selectedBrands
            ));
          }),
        )
      );
    }
    return checkboxes;
  }
}