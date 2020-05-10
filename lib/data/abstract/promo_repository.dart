// Promo repository
// Author: openflutterproject@gmail.com
// Date: 2020-05-09

import 'package:openflutterecommerce/data/abstract/model/promo.dart';

abstract class PromoRepository {
  Future<List<Promo>> getPromoList();
}