import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/data/abstract/cart_repository.dart';
import 'package:openflutterecommerce/data/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/abstract/favorites_repository.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/abstract/user_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/repositories/cart_repository_impl.dart';
import 'package:openflutterecommerce/data/repositories/category_repository_impl.dart';
import 'package:openflutterecommerce/data/repositories/product_repository_impl.dart';
import 'package:openflutterecommerce/data/repositories/user_repository_impl.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/remote_user_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:openflutterecommerce/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/cart/get_cart_products_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/get_product_by_id_use_case.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));

  //get cart product use case  
  sl.registerLazySingleton<GetCartProductsUseCase>(() => GetCartProductsUseCaseImpl());

  //add to cart use case
  sl.registerLazySingleton<AddProductToCartUseCase>(() => AddProductToCartUseCaseImpl());

  //get categories list by filter use case
  sl.registerLazySingleton<FindCategoriesByFilterUseCase>(() => FindCategoriesByFilterUseCaseImpl());

  //get product list by filter use case
  sl.registerLazySingleton<FindProductsByFilterUseCase>(() => FindProductsByFilterUseCaseImpl());

  //get product details by id use case
  sl.registerLazySingleton<GetProductByIdUseCase>(() => GetProductByIdUseCaseImpl());

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<WoocommercWrapperAbstract>(
    () => WoocommerceWrapper(client: sl()),
  );
  
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(),
  );
  
  sl.registerLazySingleton<RemoteUserRepository>(
    () => RemoteUserRepository(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteUserRepository: sl()),
  );
  
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => ProductRepositoryImpl(),
  );
}
