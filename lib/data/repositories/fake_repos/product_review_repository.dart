import 'dart:math';

import '../../model/product_review.dart';

class ProductReviewRepository {
  final results = [
    ProductReview(
        id: 1,
        productId: 2,
        authorName: 'Jhon Doe',
        authorPhotoUrl:
            'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        rating: 4,
        comment:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
    ProductReview(
      id: 2,
      productId: 2,
      authorName: 'Flutter Reviewer',
      authorPhotoUrl:
          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      rating: 4,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      photos: [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      id: 3,
      productId: 5,
      authorName: 'Juan Agú',
      authorPhotoUrl: 'http://personal.psu.edu/xqz5228/jpg.jpg',
      rating: 5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      photos: [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      id: 4,
      productId: 6,
      authorName: 'Flutter Reviewer',
      authorPhotoUrl:
          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      rating: 1,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    ),
    ProductReview(
      id: 5,
      productId: 7,
      authorName: 'Jhon Doe2',
      authorPhotoUrl:
          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      rating: 2,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      isHelpful: true,
      photos: ['http://personal.psu.edu/xqz5228/jpg.jpg'],
    ),
    ProductReview(
      id: 6,
      productId: 8,
      authorName: 'Flutter Reviewer2',
      authorPhotoUrl:
          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      rating: 3,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      photos: [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      id: 7,
      productId: 8,
      authorName: 'Jhon Doe3',
      authorPhotoUrl:
          'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      rating: 4,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      isHelpful: true,
    ),
    ProductReview(
      id: 8,
      productId: 9,
      authorName: 'Flutter Reviewer3',
      authorPhotoUrl:
          'https://i.pinimg.com/474x/9e/8e/18/9e8e18212e529bb23bcdeb3515b2276a--minions-movie--minion-movie.jpg',
      rating: 5,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      isHelpful: false,
    ),
  ];

  Future<List<ProductReview>> findReviewsByProductId(
      int productId, bool withPhotos) async {
    await Future.delayed(Duration(
      seconds: 2,
    ));

    var response = _buildResponse();
    if (withPhotos) {
      return response.where((element) => element.hasPhotos()).toList();
    }

    return response;
  }

  List<ProductReview> _buildResponse() {
    var rnd = Random();
    var maxIndex = results.length - 1;
    var startIndex = rnd.nextInt(maxIndex);

    return results.sublist(startIndex, maxIndex);
  }
}
