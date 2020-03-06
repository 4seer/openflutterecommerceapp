import 'package:bloc/bloc.dart';
import 'package:openflutterecommerce/domain/entities/category.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';

import 'products_event.dart';
import 'products_state.dart';

class ProductCleanArchitectureBloc extends Bloc<ProductEvent, ProductState> {
  final FindProductsByFilterUseCase findProductsByFilterUseCase;

  ProductCleanArchitectureBloc(
    this.findProductsByFilterUseCase,
  );

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductChangeSelectedCategoriesEvent) {
      var result = await findProductsByFilterUseCase.execute(
        ProductsByFilterParams(
          category: Category(event.selectedCategories.first.id),
        ),
      );

      yield* result.fold(
        (failure) async* {
          //return the state with the error
        },
        (data) async* {
          //return the state with the data result
        },
      );
    }
  }
}

/*
* To call this Bloc first need create the use case with the IoC e.g
*  in a ProductUseCasesFactory...
*  var repository = ProductRepositoryFactory(...).create()
*  ProductCleanArchitectureBloc(FindProductsByFilterUseCaseImpl(repository));
* */