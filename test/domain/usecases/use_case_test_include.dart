

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:openflutterecommerce/data/repositories/abstract/category_repository.dart';
import 'package:openflutterecommerce/data/repositories/abstract/product_repository.dart';
import 'package:openflutterecommerce/data/network/network_status.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/category_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

class MockWoocommerceWrapper extends Mock implements WoocommercWrapperAbstract { }

final sl = GetIt.instance; 

void setupLocator() {
  sl.allowReassignment = true;
  
  MockWoocommerceWrapper woocommerce = MockWoocommerceWrapper();

  sl.registerLazySingleton<MockWoocommerceWrapper>(
    () => woocommerce,
  );
  
  sl.registerLazySingleton<WoocommercWrapperAbstract>(
    () => woocommerce,
  );
  
  sl.registerLazySingleton<CategoryRepository>(
    () => RemoteCategoryRepository(woocommerce: woocommerce),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => RemoteProductRepository(woocommerce: sl()),
  );
  
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));
}