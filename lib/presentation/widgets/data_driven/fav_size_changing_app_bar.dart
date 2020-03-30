import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/favorites/favorite_bloc.dart';
import 'package:openflutterecommerce/presentation/features/favorites/favorites.dart';
import 'package:openflutterecommerce/presentation/features/products/views/visual_filter.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/view_options.dart';

class FavSizeChangingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        return SliverAppBar(
          expandedHeight: AppSizes.app_bar_expanded_size,
          title: Text('Favorites'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null, //TODO add search
            )
          ],
          centerTitle: true,
          floating: true,
          flexibleSpace: Column(
            children: <Widget>[
              Spacer(),
              Container(
                height: 30,
                child: VisualFilter(state.filterRules?.topmostOption,
                    (updateValue, isSelected) {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      ProductChangeFilterRulesEvent(isSelected
                          ? state.filterRules.copyWithAdditionalAttribute(
                              state.filterRules.topmostOption.key, updateValue)
                          : state.filterRules.copyWithRemovedAttributeValue(
                              state.filterRules.topmostOption.key,
                              updateValue)));
                }),
              ),
              OpenFlutterViewOptions(
                sortRules: state.sortBy,
                filterRules: state.filterRules,
                isListView: state.isList,
                onChangeViewClicked: () {
                  BlocProvider.of<FavouriteBloc>(context)
                      .add(ProductsChangeViewEvent());
                },
                onFilterChanged: (filter) {
                  BlocProvider.of<FavouriteBloc>(context)
                      .add(ProductChangeFilterRulesEvent(filter));
                },
                onSortChanged: (sort) {
                  BlocProvider.of<FavouriteBloc>(context)
                      .add(ProductChangeSortRulesEvent(sort));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
