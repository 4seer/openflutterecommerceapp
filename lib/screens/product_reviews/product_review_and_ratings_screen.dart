import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/widgets.dart';

class OpenFlutterReviewsAndRatingsScreen extends StatelessWidget {
  const OpenFlutterReviewsAndRatingsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: _buildContent(context),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: _buildFooter(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView(
        children: _buildChildren(context),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    var children = List<Widget>();
    children.add(_buildTitle(context));
    children.add(_buildRatingSummary(context));
    children.add(_buildTitleCommentAndFilter(context));
    children.add(_buildProductReviewItem());
    children.add(_buildProductReviewItem());
    children.add(_buildProductReviewItem());
    children.add(_buildProductReviewItem());
    return children;
  }

  Widget _buildProductReviewItem() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: OpenFlutterProductReviewItem(
        rating: 4,
        starCount: 5,
        writerName: "Helene moore",
        isHelpfulMarked: true,
        comment:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        avatarUrl: "https://avatars1.githubusercontent.com/u/4689126?s=460&v=4",
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: OpenFlutterBlockHeader(
        title: "Ratings&Reviews",
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _buildRatingSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: OpenFlutterRatingSummary(
        barColor: Theme.of(context).accentColor,
        ratingQuantity: 23,
        rating: 4.3,
        startCount: 5,
        starQuantities: [
          StarQuantity(
            quantity: 12,
            rating: 5,
          ),
          StarQuantity(
            quantity: 11,
            rating: 4,
          ),
          StarQuantity(
            quantity: 12,
            rating: 3,
          ),
          StarQuantity(
            quantity: 2,
            rating: 2,
          ),
          StarQuantity(
            quantity: 5,
            rating: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleCommentAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "8 reviews",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Expanded(
            child: OpenFlutterCheckbox(
              width: MediaQuery.of(context).size.width * 0.5,
              mainAxisAlignment: MainAxisAlignment.end,
              checked: false,
              title: "with photos",
              onTap: (value) => {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: 100.0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white12,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: OpenFlutterButton(
            title: "Write a review",
            icon: Icons.edit,
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
      ],
    );
  }
}
