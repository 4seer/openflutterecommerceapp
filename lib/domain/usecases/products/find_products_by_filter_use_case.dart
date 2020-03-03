import 'package:openflutterecommerce/domain/usecases/base_use_case.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_params.dart';
import 'package:openflutterecommerce/domain/usecases/products/products_by_filter_result.dart';

abstract class FindProductsByFilterUseCase
    implements BaseUseCase<ProductsByFilterResult, ProductsByFilterParams> {}
