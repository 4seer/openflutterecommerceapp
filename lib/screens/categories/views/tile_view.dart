// Category Tile View (with images)
// Author: openflutterproject@gmail.com
// Date: 2020-02-06
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/screens/products/products_screen.dart';
import 'package:openflutterecommerce/widgets/category_tile.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import '../categories.dart';
import '../categories_bloc.dart';

class CategoriesTileView extends StatefulWidget {
  final Function changeView;

  const CategoriesTileView({Key key, this.changeView}) : super(key: key);
  
  @override
  _CategoriesTileViewState createState() => _CategoriesTileViewState();
}

class _CategoriesTileViewState extends State<CategoriesTileView>     
  with SingleTickerProviderStateMixin
{
  final List<String> types = ["Women","Men","Kids"];
  final List<int> categotyIds = [1,2,3];
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: this.types.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;
    final bloc = BlocProvider.of<CategoryBloc>(context);
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, CategoryState state) {
        if (state is CategoryErrorState) {
          return Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            child: Text('An error occured',
              style: _theme.textTheme.headline3.copyWith(
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
          if (state is CategoryTileViewState) { 
            List<Widget> tabViews = List<Widget>();
            for(int categoryId in categotyIds )
              tabViews.add(
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(AppSizes.sidePadding),
                        child: Container (
                          width: width,
                          padding: EdgeInsets.all(AppSizes.sidePadding*2),
                          decoration: new BoxDecoration(
                            color: _theme.accentColor,
                            borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('SUMMER SALES',
                                style: _theme.textTheme.headline3),
                              Text('Up to 50% off',
                                style: _theme.textTheme.headline3.copyWith(
                                  color: AppColors.white
                                )
                              )
                            ],
                          )
                        )
                      ),
                      Container(
                        padding: EdgeInsets.all(AppSizes.sidePadding),
                        child: Column(
                          children: buildCategoryList(
                            bloc.categoryRepository.getCategories(categoryId), 
                            width - AppSizes.sidePadding*3)
                        )
                      )
                    ]
                  )
                )
              );
            return SafeArea(
              child: OpenFlutterScaffold(
                background: null,
                title: "Categories",
                bottomMenuIndex: 1,
                tabController: _tabController,
                tabBarList: this.types,
                body:TabBarView(
                  children: tabViews,
                  controller: _tabController,
                )
              )
            );
          }
          return Center(child: CircularProgressIndicator());
        }
      )
    );
  }

  buildCategoryList(List<Category> categories, double width){
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
          child: OpenFlutterCategoryTile(height: 100, width: width, category: categories[i])
        )
      );
    }
    return elements;
  }
}