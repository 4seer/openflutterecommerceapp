
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/promo.dart';
import 'package:openflutterecommerce/data/repositories/abstract/promo_repository.dart';
import 'package:openflutterecommerce/data/woocommerce/models/promo_code_model.dart';
import 'package:openflutterecommerce/data/woocommerce/repositories/woocommerce_wrapper.dart';

class RemotePromoRepository extends PromoRepository {
  final WoocommercWrapperAbstract woocommerce;

  RemotePromoRepository({@required this.woocommerce});

  @override
  Future<List<Promo>> getPromoList() async {
    var promosData = await woocommerce.getPromoList();
    List<Promo> promos = [];
    for(int i = 0; i < promosData.length; i++){
      promos.add(
        Promo.fromEntity(PromoCodeModel.fromJson(promosData[i]))
      );
    }
    return promos;
  }
}