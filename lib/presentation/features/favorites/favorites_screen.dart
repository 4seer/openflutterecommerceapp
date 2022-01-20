// Favourites Screen
// Author: umair_adil@live.com
// Date: 2020-02-11

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/presentation/widgets/data_driven/size_changing_app_bar.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/scaffold.dart';

import 'favorites.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OpenFlutterScaffold(
        background: null,
        title: null,
        body: BlocProvider<FavouriteBloc>(
          create: (context) {
            return FavouriteBloc()..add(ScreenLoadedEvent());
          },
          child: _buildScreen(context),
        ),
        bottomMenuIndex: 3,
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (BuildContext context, FavouriteState state) {
        return CustomScrollView(
          slivers: <Widget>[
            SizeChangingAppBar(
              title: 'Favorites',
              filterRules: state.filterRules,
              sortRules: state.sortBy,
              isListView: state.isList,
              onFilterRulesChanged: (filter) {
                BlocProvider.of<FavouriteBloc>(context)
                    .add(ProductChangeFilterRulesEvent(filter));
              },
              onSortRulesChanged: (sort) {
                BlocProvider.of<FavouriteBloc>(context)
                    .add(ProductChangeSortRulesEvent(sort));
              },
              onViewChanged: () {
                BlocProvider.of<FavouriteBloc>(context)
                    .add(ProductsChangeViewEvent());
              },
            ),
            state.isList ? FavoritesListView() : FavouritesTileView()
          ],
        );
      },
    );
  }
}
