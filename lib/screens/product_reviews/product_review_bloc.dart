import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/product_review_repository.dart';
import 'product_review_event.dart';
import 'product_review_state.dart';

class ProductReviewBloc extends Bloc<ProductReviewEvent, ProductReviewState> {
  final ProductReviewRepository productReviewRepository;

  ProductReviewBloc(this.productReviewRepository);

  @override
  ProductReviewState get initialState => ProductReviewInitialState();

  @override
  Stream<ProductReviewState> mapEventToState(ProductReviewEvent event) async* {
    if (event is ProductReviewStartEvent) {
      yield ProductReviewLoadingState();

      var result =
          await productReviewRepository.findReviewsByProductId(event.productId);

      var data = ProductReviewData(result, result.length);

      yield ProductReviewLoadedState(data);
    }
  }
}
