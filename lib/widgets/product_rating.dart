// Product rating element with number of reviews
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

// Clean code and refactor to support rating selection
// Author: juan.agu@outlook.com
// Date: 2020-02-23

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenFlutterProductRating extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final double iconSize;
  final double spacing;
  final bool rtl;
  final bool showLabel;
  final bool editable;
  final bool showDefaultStar;
  final Function(double rating) onRatingSelected;

  const OpenFlutterProductRating({
    Key key,
    this.rating,
    this.ratingCount,
    this.iconSize = 24.0,
    this.spacing = 2.0,
    this.onRatingSelected,
    this.rtl = false,
    this.showLabel = true,
    this.editable = false,
    this.showDefaultStar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStars(context, rating),
        _buildRatingLabel(context),
      ],
    );
  }

  Widget _buildStars(BuildContext context, double rating) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: spacing,
      children: List.generate(ratingCount, (index) => _buildStar(index)),
    );
  }

  Widget _buildStar(int index) {
    return GestureDetector(
      onTap: () {
        if (editable) {
          onRatingSelected(_calculateRatingSelected(index));
        }
      },
      child: Container(
        width: iconSize + 2.0,
        height: iconSize + 2.0,
        child: Center(
          child: _buildStarIcon(index),
        ),
      ),
    );
  }

  Widget _buildStarIcon(int index) {
    var isSelected = _isStarSelected(index);

    if (isSelected || showDefaultStar) {
      return SvgPicture.asset(
          "assets/icons/products/star" + (isSelected ? "_fav" : "") + ".svg",
          width: iconSize,
          height: iconSize);
    }

    return Container(
      width: iconSize,
      height: iconSize,
    );
  }

  double _calculateRatingSelected(int index) {
    if (!rtl) {
      return index + 1.0;
    }

    return ratingCount - (index + 1.0);
  }

  bool _isStarSelected(int index) {
    if (!rtl) {
      return rating > index;
    }

    return rating > (ratingCount - (index + 1));
  }

  Widget _buildRatingLabel(BuildContext context) {
    return showLabel && rating > 0 ? _buildLabel(context) : Container();
  }

  Widget _buildLabel(BuildContext context) {
    return Text(' (' + rating.toInt().toString() + ')',
        style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14));
  }
}
