//import 'data/local/all_tests.dart' as local_database_test;
import 'data/abstract/all_tests.dart' as abstract_test;
import 'data/woocommerce/woocommerce_tests.dart' as woocommerce_test;
import 'domain/usecases/all_use_case_test.dart' as use_case_test;

void main() {
  //run local database tests using
  //command: flutter run -t test/data/local/all_tests.dart
  //await local_database_test.main(args);

  //run all other tests using 
  //command: flutter test test/tests.dart
  use_case_test.main();
  woocommerce_test.main();
  abstract_test.main();
}
