class SortRules {
  final SortOrder sortOrder;
  final SortType sortType;

  const SortRules(
      {this.sortOrder = SortOrder.FromHighestToLowest,
      this.sortType = SortType.DateAdded});

  static List<SortRules> get options => SortType.values.fold(
      [],
      (list, sortType) => list
        ..addAll([
          SortRules(
              sortType: sortType, sortOrder: SortOrder.FromHighestToLowest),
          SortRules(
              sortType: sortType, sortOrder: SortOrder.FromLowestToHighest),
        ]));

  String getSortTitle() {
    switch (sortType) {
      case SortType.DateAdded:
        if (sortOrder == SortOrder.FromHighestToLowest) {
          return 'Newest first';
        } else {
          return 'Oldest first';
        }
        break;
      case SortType.Reviewed:
        if (sortOrder == SortOrder.FromHighestToLowest) {
          return 'Reviewed first';
        } else {
          return 'Unreviewed first';
        }
        break;
      case SortType.Price:
        if (sortOrder == SortOrder.FromHighestToLowest) {
          return 'Expensive first';
        } else {
          return 'Cheapest first';
        }
        break;
      case SortType.Popularity:
        if (sortOrder == SortOrder.FromHighestToLowest) {
          return 'Popular first';
        } else {
          return 'Unpopular first';
        }
        break;
      default:
        return 'No order';
    }
  }
}

enum SortType { DateAdded, Reviewed, Price, Popularity }
enum SortOrder { FromLowestToHighest, FromHighestToLowest }
