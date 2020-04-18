import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(sl()));
  
  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<WoocommercWrapperAbastract>(
    () => WoocommerceWrapper(client: sl()),
  );
  
  sl.registerLazySingleton<ProductRepository>(
    () => RemoteProductRepository(woocommerce: sl()),
  );
}
