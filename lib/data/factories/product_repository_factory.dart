import 'package:openflutterecommerce/config/app_settings.dart';
import 'package:openflutterecommerce/data/cache/ProductCacheRepository.dart';
import 'package:openflutterecommerce/data/local/product_local_repository.dart';
import 'package:openflutterecommerce/data/remote/product_remote_repository.dart';
import 'package:openflutterecommerce/domain/repositories/product_repository.dart';

class ProductRepositoryFactory {
  final AppSettings appSettings;

  ProductRepositoryFactory(this.appSettings);

  ProductRepository create() {
    if (this.appSettings.cacheIsEnabled) {
      return ProductCacheRepository(
        ProductLocalRepository(),
        ProductRemoteRepository(),
      );
    }

    //TODO in this point the app should be call an interface to detected if the device has internet
    bool hasInternet = false;
    if (hasInternet) {
      return ProductRemoteRepository();
    }

    return ProductLocalRepository();
  }
}
