import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/fake_repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({this.productRepository});

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductStartEvent) {
      yield ProductLoadingState();

      var data = productRepository.getProduct(event.productId);
      var similarProducts = productRepository.getProducts(1);
      yield ProductLoadedState(product: data, similarProducts: similarProducts);
    } else if (event is ProductAddToFavEvent) {
      productRepository.addToFav(event.productId);
    } else if (event is ProductAddToFavEvent) {
      productRepository.removeFromFav(event.productId);
    } else if (event is ProductAddToCartEvent) {
      //TODO: add to cart
    } else if (event is ProductSetSizeEvent) {
      //TODO: add to cart
    } else if (event is ProductSetColorEvent) {
      //TODO: add to cart
    }
  }
}
