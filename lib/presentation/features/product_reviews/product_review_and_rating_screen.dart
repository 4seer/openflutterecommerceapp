import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/product_review.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_review_repository.dart';
import 'package:openflutterecommerce/presentation/widgets/widgets.dart';

import 'product_review_bloc.dart';
import 'product_review_event.dart';
import 'product_review_state.dart';

class ProductReviewRatingScreen extends StatefulWidget {
  final Product product;

  const ProductReviewRatingScreen({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductReviewRatingScreenState();
  }
}

class ProductReviewRatingScreenState extends State<ProductReviewRatingScreen> {
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 120.0,
          centerTitle: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: _buildTitle(context),
          ),
        ),
        BlocProvider<ProductReviewBloc>(
          create: (context) {
            return ProductReviewBloc(ProductReviewRepository())
              ..add(ProductReviewStartEvent(widget.product.id, false));
          },
          child: ProductReviewWrapper(
            product: widget.product,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Ratings&Reviews',
      style: Theme.of(context).textTheme.headline2,
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
            title: 'Write a review',
            icon: Icons.edit,
            width: MediaQuery.of(context).size.width * 0.5,
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}

class ProductReviewWrapper extends StatefulWidget {
  final Product product;
  final summaryAndFilterIndex = 2;

  const ProductReviewWrapper({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductReviewWrapperState();
  }
}

class ProductReviewWrapperState extends State<ProductReviewWrapper> {
  List<ProductReview> comments;
  int reviewCount = 0;
  bool withPhotos = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReviewBloc, ProductReviewState>(
        bloc: BlocProvider.of<ProductReviewBloc>(context),
        builder: (BuildContext context, ProductReviewState state) {
          _readState(state);

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: _buildItem(context, index),
                );
              },
              childCount: comments != null
                  ? comments.length + widget.summaryAndFilterIndex
                  : widget.summaryAndFilterIndex + 1,
            ),
          );
        });
  }

  void _readState(ProductReviewState state) {
    if (state is ProductReviewLoadingState) {
      comments = null;
      reviewCount = 0;
    }

    if (state is ProductReviewLoadedState) {
      comments = state.data.reviews;
      reviewCount = state.data.reviewCounter;
      withPhotos = state.data.withPhotos;
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        return _buildRatingSummary(context);
      case 1:
        return _buildTitleCommentAndFilter(context);
      default:
        return _buildProductReviewItem(index);
    }
  }

  Widget _buildRatingSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: OpenFlutterRatingSummary(
        barColor: Theme.of(context).accentColor,
        ratingQuantity: widget.product.ratingCount,
        rating: widget.product.rating,
        ratingDetail: mapRatingDetail(),
      ),
    );
  }

  List<StarQuantity> mapRatingDetail() {
    return widget.product != null
        ? widget.product.ratingDetail
            .map(
              (e) => StarQuantity(
                rating: e.rating,
                quantity: e.quantity,
              ),
            )
            .toList()
        : null;
  }

  Widget _buildTitleCommentAndFilter(BuildContext context) {
    if (reviewCount > 0) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$reviewCount reviews',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Expanded(
              child: OpenFlutterCheckbox(
                width: MediaQuery.of(context).size.width * 0.5,
                mainAxisAlignment: MainAxisAlignment.end,
                checked: withPhotos,
                title: 'with photos',
                onTap: (value) {
                  BlocProvider.of<ProductReviewBloc>(context)
                      .add(ProductReviewStartEvent(widget.product.id, value));
                },
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox();
  }

  Widget _buildProductReviewItem(int index) {
    if (comments == null) {
      return _buildIndicator();
    }

    if (comments.isNotEmpty) {
      var productReview = _getProductReview(index, comments);

      return Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
        ),
        child: OpenFlutterProductReviewItem(
          rating: productReview.rating,
          writerName: productReview.authorName,
          isHelpfulMarked: productReview.isHelpful,
          comment: productReview.comment,
          avatarUrl: productReview.authorPhotoUrl,
          withPhotos: withPhotos,
          photos: productReview.photos,
        ),
      );
    }

    return _buildEmptyCommentsView();
  }

  ProductReview _getProductReview(int index, List<ProductReview> comments) {
    var realIndex = index - widget.summaryAndFilterIndex;

    var productReview = comments[realIndex];
    return productReview;
  }

  Padding _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildEmptyCommentsView() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Text(
          'Without reviews',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
