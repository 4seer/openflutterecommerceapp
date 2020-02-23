import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/widgets/product_rating.dart';

class OpenFlutterProductReviewItem extends StatelessWidget {
  final double avatarSize;
  final String writerName;
  final String reviewDateTime;
  final String description;
  final String avatarUrl;

  const OpenFlutterProductReviewItem({
    Key key,
    this.avatarUrl = "",
    this.avatarSize = 40.0,
    this.writerName = "Anonimo",
    this.reviewDateTime = "June 5, 2019",
    this.description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingReview = _hasAnAvatar() ? 12.0 : 0.0;
    return Container(
      width: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: paddingReview,
              top: paddingReview,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(context),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        bottom: 8.0,
                      ),
                      child: _buildRatingInformation(context),
                    ),
                    _buildReviewDescription(context),
                  ],
                ),
              ),
            ),
          ),
          _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    if (_hasAnAvatar()) {
      return Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            avatarUrl,
          ),
        ),
      );
    }

    return SizedBox();
  }

  bool _hasAnAvatar() => avatarUrl != null && avatarUrl.isNotEmpty;

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        writerName,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildRatingInformation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        OpenFlutterProductRating(
          showLabel: false,
          ratingCount: 5,
          rating: 3.0,
          editable: false,
          iconSize: 14.0,
          spacing: 1.0,
        ),
        Expanded(
          child: Text(
            reviewDateTime,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 12,
                ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }

  Widget _buildReviewDescription(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
            fontSize: 14.0,
          ),
    );
  }
}
