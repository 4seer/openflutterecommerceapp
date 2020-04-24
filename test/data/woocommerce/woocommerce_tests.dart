import 'models/product_category_model_test.dart' as product_category_model_test;
import 'repositories/category_remote_repository_test.dart' as category_remote_repository_test;

void main(List<String> args) {
  category_remote_repository_test.main();
  product_category_model_test.main();
}