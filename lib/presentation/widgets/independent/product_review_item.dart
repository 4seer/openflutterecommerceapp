// Product review item: show the author of the review rating comment, date and support show or hide photos
// Author: juan.agu@outlook.com
// Date: 2020-02-23

import 'package:flutter/material.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

class OpenFlutterProductReviewItem extends StatelessWidget {
  final double avatarSize;
  final String writerName;
  final String reviewDateTime;
  final String comment;
  final String avatarUrl;

  final bool withPhotos;
  final List<String> photos;
  final double photoSize;

  final double rating;
  final int starCount;

  final Function onHelpfulTapped;
  final bool isHelpfulMarked;
  final double helpfulIconSize;
  final double helpfulFontSize;

  const OpenFlutterProductReviewItem({
    Key key,
    this.avatarUrl = '',
    this.avatarSize = 40.0,
    this.writerName = '',
    this.starCount = 0,
    this.rating = 0.0,
    this.reviewDateTime = '',
    this.comment = '',
    this.withPhotos = false,
    this.photos,
    this.photoSize = 96.0,
    this.onHelpfulTapped,
    this.isHelpfulMarked = false,
    this.helpfulIconSize = 14.0,
    this.helpfulFontSize = 12.0,
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
                    _buildReviewComment(context),
                    _buildPhotos(context),
                    _buildIsHelpful(context),
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
          ratingCount: starCount,
          rating: rating,
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

  Widget _buildReviewComment(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        comment,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 14.0,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildPhotos(BuildContext context) {
    if (withPhotos && photos != null && photos.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: SizedBox(
          height: photoSize,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _buildPhotosItems(),
          ),
        ),
      );
    }

    return SizedBox();
  }

  List<Widget> _buildPhotosItems() {
    var list = List<Widget>.generate(
        photos.length, (index) => _buildPhotoItem(photos[index]));
    return list;
  }

  Widget _buildPhotoItem(String photoUrl) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12.0,
      ),
      child: SizedBox(
        width: photoSize,
        height: photoSize,
        child: Image.network(
          photoUrl,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIsHelpful(BuildContext context) {
    return GestureDetector(
      onTap: onHelpfulTapped,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 32.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Helpful',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: _getHelpfulColor(context),
                      fontSize: helpfulFontSize,
                    ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Center(
              child: Icon(
                Icons.thumb_up,
                color: _getHelpfulColor(context),
                size: helpfulIconSize,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getHelpfulColor(BuildContext context) {
    return isHelpfulMarked
        ? Theme.of(context).accentColor
        : Theme.of(context).unselectedWidgetColor;
  }
}
