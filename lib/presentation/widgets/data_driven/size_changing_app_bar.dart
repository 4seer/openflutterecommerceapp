import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/presentation/features/products/bloc_list_data.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';
import 'package:openflutterecommerce/presentation/features/products/views/visual_filter.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/view_options.dart';

class SizeChangingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        ProductListData data = state.data;
        return SliverAppBar(
          expandedHeight: AppSizes.app_bar_expanded_size,
          title: Text(data?.category?.name ?? 'Loading...'),
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
                  BlocProvider.of<ProductsBloc>(context).add(
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
                isListView: state is ProductsListViewState,
                onChangeViewClicked: () {
                  BlocProvider.of<ProductsBloc>(context)
                      .add(ProductsChangeViewEvent());
                },
                onFilterChanged: (filter) {
                  BlocProvider.of<ProductsBloc>(context)
                      .add(ProductChangeFilterRulesEvent(filter));
                },
                onSortChanged: (sort) {
                  BlocProvider.of<ProductsBloc>(context)
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
