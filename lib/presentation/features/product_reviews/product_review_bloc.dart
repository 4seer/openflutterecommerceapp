import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/model/product_review.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/product_review_repository.dart';

import 'product_review_event.dart';
import 'product_review_state.dart';

class ProductReviewBloc extends Bloc<ProductReviewEvent, ProductReviewState> {
  final ProductReviewRepository productReviewRepository;

  ProductReviewBloc(this.productReviewRepository):super(ProductReviewInitialState());
  
  @override
  Stream<ProductReviewState> mapEventToState(ProductReviewEvent event) async* {
    if (event is ProductReviewStartEvent) {
      yield ProductReviewLoadingState();

      var comments =
          await _getCommentsReviews(event.productId, event.withPhotos);

      var data = ProductReviewData(comments, comments.length, event.withPhotos);

      yield ProductReviewLoadedState(data);
    }
  }

  Future<List<ProductReview>> _getCommentsReviews(
      int productId, bool withPhotos) async {
    return await productReviewRepository.findReviewsByProductId(
        productId, withPhotos);
  }
}
