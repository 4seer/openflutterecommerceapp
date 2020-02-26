import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/models/product_review.dart';
import 'package:openflutterecommerce/repos/product_review_repository.dart';
import 'product_review_event.dart';
import 'product_review_state.dart';

class ProductReviewBloc extends Bloc<ProductReviewEvent, ProductReviewState> {
  final ProductReviewRepository productReviewRepository;
  List<ProductReview> comments;

  ProductReviewBloc(this.productReviewRepository);

  @override
  ProductReviewState get initialState => ProductReviewInitialState();

  @override
  Stream<ProductReviewState> mapEventToState(ProductReviewEvent event) async* {
    if (event is ProductReviewStartEvent) {
      yield ProductReviewLoadingState();

      comments =
          await productReviewRepository.findReviewsByProductId(event.productId);

      var data = _buildData();

      yield ProductReviewLoadedState(data);
    }

    if (event is ProductReviewWithPhotosEvent) {
      yield ProductReviewLoadingState();
      var data = _buildData();
      yield ProductReviewWithPhotosState(data, event.withPhotos);
    }
  }

  ProductReviewData _buildData() {
    return ProductReviewData(comments, comments.length);
  }
}
