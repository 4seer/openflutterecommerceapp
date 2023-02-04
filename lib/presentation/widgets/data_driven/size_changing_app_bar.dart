import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/model/filter_rules.dart';
import 'package:openflutterecommerce/data/model/sort_rules.dart';
import 'package:openflutterecommerce/presentation/features/products/products.dart';
import 'package:openflutterecommerce/presentation/features/products/views/visual_filter.dart';
import 'package:openflutterecommerce/presentation/widgets/independent/view_options.dart';

class SizeChangingAppBar extends StatelessWidget {
  final String title;
  final FilterRules? filterRules;
  final SortRules? sortRules;
  final bool isListView;
  final Function(FilterRules) onFilterRulesChanged;
  final Function(SortRules) onSortRulesChanged;
  final VoidCallback onViewChanged;

  const SizeChangingAppBar(
      {required this.title, this.filterRules, this.sortRules,
      this.isListView = true,
      required this.onFilterRulesChanged,
      required this.onSortRulesChanged,
      required this.onViewChanged});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: AppSizes.app_bar_expanded_size,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: null, //TODO add search
        )
      ],
      floating: true,
      primary: true,
      snap: false,
      pinned: false,
      /*bottom: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ,
      ),*/
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                title ?? 'Loading...',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Container(
              height: 30,
              child: VisualFilter(
                  filterRules!.hashTags, filterRules!.selectedHashTags,
                  (updateValue, isSelected) {
                BlocProvider.of<ProductsBloc>(context).add(
                    ProductChangeHashTagEvent(updateValue, isSelected));
              }),
            ),
            OpenFlutterViewOptions(
              sortRules: sortRules,
              filterRules: filterRules,
              isListView: isListView,
              onChangeViewClicked: onViewChanged,
              onFilterChanged: onFilterRulesChanged,
              onSortChanged: onSortRulesChanged,
            ),
          ],
        ),
      ),
    );
  }
}
