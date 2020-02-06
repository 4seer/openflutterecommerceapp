// Category List View
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/screens/products/products_screen.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/category_list_element.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

import '../categories_bloc.dart';
import '../categories_event.dart';
import '../categories_state.dart';

class CategoriesListView extends StatefulWidget {
  final Function changeView;

  const CategoriesListView({Key key, this.changeView}) : super(key: key);
  
  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double widgetWidth = width - AppSizes.sidePadding*4;
    final bloc = BlocProvider.of<CategoryBloc>(context);
    ThemeData _theme = Theme.of(context);
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is CategoryErrorState) {
          return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
              style: _theme.textTheme.subtitle.copyWith(
                color: _theme.errorColor
              )
            )
          );
        }
        return Container();
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is CategoryListViewState) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(
                    top: AppSizes.sidePadding)
                  ),
                  OpenFlutterButton(
                    onPressed: ( () => {
                        bloc..dispatch(CategoryShowTilesEvent(1)),
                        widget.changeView(changeType: ViewChangeType.Forward)
                      }
                    ),
                    title: "VIEW ALL ITEMS",
                    width: widgetWidth,
                    height: 50
                  ),
                  Padding(padding:EdgeInsets.only(top:AppSizes.sidePadding)),
                  state.isLoading?
                  Center(child: CircularProgressIndicator()):
                  Column(children: buildCategoryList(state.categories))
                ]
              )
            );
          }
          return Center(child: CircularProgressIndicator());
        }
      )
    );
  }
  buildCategoryList(List<Category> categories){
    List<Widget> elements = List<Widget>();
    for(int i=0;i<categories.length;i++){
      elements.add(
        InkWell(
          onTap: ( () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ProductsScreen(categoryId: categories[i].id);
              }),
            );
          }),
          child: OpenFlutterCatregoryListElement(category: categories[i])
        )
      );
    }
    return elements;
  }
}