import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_product_by_id_use_case.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));

  //get categories list by filter use case
  sl.registerLazySingleton<FindCategoriesByFilterUseCase>(() => FindCategoriesByFilterUseCaseImpl());

  //get product list by filter use case
  sl.registerLazySingleton<FindProductsByFilterUseCase>(() => FindProductsByFilterUseCaseImpl());

  //get product details by id use case
  sl.registerLazySingleton<GetProductByIdUseCase>(() => GetProductByIdUseCaseImpl());

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<WoocommercWrapperAbastract>(
    () => WoocommerceWrapper(client: sl()),
  );
  
  sl.registerLazySingleton<CategoryRepository>(
    () => RemoteCategoryRepository(woocommerce: sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => RemoteProductRepository(woocommerce: sl()),
  );
}
