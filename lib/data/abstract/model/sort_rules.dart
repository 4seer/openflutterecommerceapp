class SortRules {
  final SortOrder sortOrder;
  final SortType sortType;

  String get jsonRuleName {
    switch (sortType) {
      case SortType.DateAdded:
        return 'date';
      case SortType.Reviewed:
        return 'date'; //TODO change something about it
      case SortType.Price:
        return 'date'; //TODO change something about it
      case SortType.Popularity:
      default:
        return 'date'; //TODO change something about it
    }
  }

  const SortRules(
      {this.sortOrder = SortOrder.FromHighestToLowest,
      this.sortType = SortType.DateAdded});

  String get jsonOrder =>
      sortOrder == SortOrder.FromLowestToHighest ? 'asc' : 'desc';

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

  Map<SortType, String> get sortTextVariants => {
        SortType.DateAdded: 'Date added',
        SortType.Reviewed: 'Reviews',
        SortType.Price: 'Price',
        SortType.Popularity: 'Popularity'
      };

  SortRules copyWithChangedOrder() {
    return SortRules(
        sortType: sortType,
        sortOrder: sortOrder == SortOrder.FromHighestToLowest
            ? SortOrder.FromLowestToHighest
            : SortOrder.FromHighestToLowest);
  }
}

enum SortType { DateAdded, Reviewed, Price, Popularity }
enum SortOrder { FromLowestToHighest, FromHighestToLowest }
