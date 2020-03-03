// Rating summary widget
// Author: juan.agu@outlook.com
// Date: 2020-02-23

import 'package:flutter/material.dart';

import 'widgets.dart';

class OpenFlutterRatingSummary extends StatelessWidget {
  final double rating;
  final List<StarQuantity> ratingDetail;
  final int startCount;
  final int ratingQuantity;
  final bool showLabel;
  final Color barColor;
  final double barHeight;
  final double starIconSize;
  final double labelFontSize;
  final double reviewCounterLabelFontSize;

  const OpenFlutterRatingSummary({
    Key key,
    this.startCount = 5,
    this.rating = 5,
    this.ratingQuantity = 0,
    this.showLabel = true,
    this.ratingDetail,
    this.barColor = Colors.redAccent,
    this.barHeight = 10.0,
    this.starIconSize = 14.0,
    this.labelFontSize = 14.0,
    this.reviewCounterLabelFontSize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _buildSummaryQuantity(context),
          _buildSummaryList(context),
        ],
      ),
    );
  }

  Widget _buildSummaryQuantity(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          rating.toString(),
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.black,
              ),
        ),
        _buildLabel(context),
      ],
    );
  }

  Widget _buildSummaryList(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildList(context),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    if (showLabel) {
      return Text(
        '${ratingQuantity.toString()} ratings',
        style: Theme.of(context).textTheme.caption.copyWith(
              color: Colors.grey,
              fontSize: labelFontSize,
            ),
      );
    }

    return SizedBox(
      height: 0,
      width: 0,
    );
  }

  List<Widget> _buildList(BuildContext context) {
    List<Widget> list = List<Widget>();
    if (ratingDetail != null && ratingDetail.isNotEmpty) {
      ratingDetail.forEach((starQuantity) {
        list.add(_buildItem(context, starQuantity));
      });
    }

    return list;
  }

  Widget _buildItem(BuildContext context, StarQuantity starQuantity) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: _buildProductRating(context, starQuantity),
            ),
            Flexible(
              flex: 5,
              child: _buildBar(context, starQuantity),
            ),
            Flexible(
              flex: 2,
              child: _buildCounter(context, starQuantity),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductRating(BuildContext context, StarQuantity starQuantity) {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: OpenFlutterProductRating(
          rating: starQuantity.rating,
          ratingCount: startCount,
          iconSize: starIconSize,
          showDefaultStar: false,
          spacing: 1.0,
          rtl: true,
          showLabel: false,
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context, StarQuantity starQuantity) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: _calculateBarWithByQuantity(starQuantity.quantity),
              child: Container(
                height: barHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(barHeight / 2),
                  color: barColor,
                ),
              ),
            ),
            Flexible(
              flex:
                  _calculateTransparentBarWithByQuantity(starQuantity.quantity),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(BuildContext context, StarQuantity starQuantity) {
    return Center(
      child: Text(
        starQuantity.quantity.toInt().toString(),
        style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: reviewCounterLabelFontSize,
            ),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }

  int _calculateBarWithByQuantity(int quantity) {
    if (quantity == 0) {
      return 0;
    }
    return (quantity * 100) ~/ ratingQuantity;
  }

  int _calculateTransparentBarWithByQuantity(int quantity) {
    if (quantity == 0) {
      return 1;
    }
    return 100 - (quantity * 100) ~/ ratingQuantity;
  }
}

class StarQuantity {
  final double rating;
  final int quantity;

  StarQuantity({
    this.rating,
    this.quantity,
  });
}
