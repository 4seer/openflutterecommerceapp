import '../test/data/local/all_tests.dart' as local_database_test;
import '../test/data/woocommerce/woocommerce_tests.dart' as woocommerce_test;

void main(List<String> args) {
  local_database_test.main(args);
  woocommerce_test.main(args);
}
