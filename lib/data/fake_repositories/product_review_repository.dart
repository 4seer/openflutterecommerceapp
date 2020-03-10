import 'dart:math';

import 'models/product_review.dart';

class ProductReviewRepository {
  final results = [
    ProductReview(
      1,
      'Jhon Doe',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      4.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      null,
    ),
    ProductReview(
      2,
      'Flutter Reviewer',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      4.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      3,
      'Juan Agú',
      'http://personal.psu.edu/xqz5228/jpg.jpg',
      5.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      4,
      'Flutter Reviewer',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      1.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      null,
    ),
    ProductReview(
      5,
      'Jhon Doe2',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      2.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      true,
      ['http://personal.psu.edu/xqz5228/jpg.jpg'],
    ),
    ProductReview(
      6,
      'Flutter Reviewer2',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      3.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      [
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg',
        'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        'http://personal.psu.edu/xqz5228/jpg.jpg'
      ],
    ),
    ProductReview(
      7,
      'Jhon Doe3',
      'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      4.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      true,
      null,
    ),
    ProductReview(
      8,
      'Flutter Reviewer3',
      'https://i.pinimg.com/474x/9e/8e/18/9e8e18212e529bb23bcdeb3515b2276a--minions-movie--minion-movie.jpg',
      5.0,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      DateTime.now(),
      false,
      null,
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
