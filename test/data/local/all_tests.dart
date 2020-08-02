import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/local/db_provider.dart';

import 'cart/product_cart_data_source_test.dart'
    as product_cart_data_source_test;
import 'delivery/delivery_method_data_source_test.dart'
    as delivery_method_data_source_test;
import 'hashtag/category_hashtag_data_source_test.dart'
    as category_hashtag_data_source_test;
import 'hashtag/hashtag_data_source_test.dart' as hash_tag_data_source_test;
import 'hashtag/product_hashtag_data_source_test.dart'
    as product_hashtag_data_source_test;
import 'order/order_product_data_source_test.dart'
    as order_product_data_source_test;
import 'order/order_product_parameter_data_source_test.dart'
    as order_product_parameter_data_source_test;
import 'order/user_order_data_source_test.dart' as user_order_data_source_test;
import 'product/product2parameter_data_source_test.dart'
    as product2parameter_data_source_test;
import 'product/product_category_data_source_test.dart'
    as product_category_data_source_test;
import 'product/product_data_source_test.dart' as product_data_source_test;
import 'product/product_image_data_source_test.dart'
    as product_image_data_source_test;
import 'product/product_parameter_data_source_test.dart'
    as product_parameter_data_source_test;
import 'product/product_parameter_variant_data_source_test.dart'
    as product_parameter_variant_data_source_test;
import 'product/product_review_data_source_test.dart'
    as product_review_data_source_test;
import 'product/product_review_photo_data_source_test.dart'
    as product_review_photo_data_source_test;
import 'promo/promo_code_data_source_test.dart' as promo_code_data_source_test;
import 'user/shipping_address_data_source_test.dart'
    as shipping_address_data_source_test;
import 'user/user_data_source_test.dart' as user_data_source_test;

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  //Use after database update
   await SQLiteDbProvider.clear();
  // run tests on all data sources (tables)
  await delivery_method_data_source_test.main();
  await category_hashtag_data_source_test.main();
  await hash_tag_data_source_test.main();
  await product_hashtag_data_source_test.main();
  await order_product_data_source_test.main();
  await order_product_parameter_data_source_test.main();
  await user_order_data_source_test.main();
  await product_category_data_source_test.main();
  await product_cart_data_source_test.main();
  await product_data_source_test.main();
  await product_image_data_source_test.main();
  await product_parameter_data_source_test.main();
  await product_parameter_variant_data_source_test.main();
  await product_review_data_source_test.main();
  await product_review_photo_data_source_test.main();
  await product2parameter_data_source_test.main();
  await promo_code_data_source_test.main();
  await shipping_address_data_source_test.main();
  await user_data_source_test.main();/**/
}
