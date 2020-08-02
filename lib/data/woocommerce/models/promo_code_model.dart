/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see promo_repository_impl.dart
 */

import 'package:intl/intl.dart';
import 'package:openflutterecommerce/domain/entities/promo/promo_code_entity.dart';

class PromoCodeModel extends PromoCodeEntity {
  PromoCodeModel({
    int id,
    String title,
    String promoCode,
    double discountPercent,
    DateTime dateExpires
  }) : super(
    id: id,
    title: title,
    promoCode: promoCode,
    discountPercent: discountPercent,
    dateExpires: dateExpires
  );

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    if ( json['images']!=null ) {
      (json['images'] as List).forEach((f) => images.add(f['src']));
    }
    return PromoCodeModel(
      id: (json['id'] as num).toInt(), 
      title: json['description'],
      promoCode: json['code'],
      discountPercent: double.parse(json['amount']),
      dateExpires: DateTime.parse(json['date_expires'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'code': promoCode,
      'amount': discountPercent,
      'discount_type': 'percent',
      'description': title,
      'date_expires':DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateExpires)
    };
  }
}