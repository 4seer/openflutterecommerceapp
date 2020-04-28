// Product model declaration
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/foundation.dart';
import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';

@immutable
class FakeProduct extends Product {
  FakeProduct(
      {@required int id,
      String title,
      String shortDescription,
      String description,
      double price,
      int discountPercent,
      int amountAvailable,
      DateTime created,
      double rating,
      int ratingCount,
      List<String> colors,
      List<String> sizes,
      List<String> localImages,
      List<ProductAttribute> productAttributes,
      bool isFavorite})
      : super(id,
          title: title,
          subTitle: title,
          shortDescription: shortDescription,
          description: description,
          isFavorite: isFavorite,
          price: price,
          discountPercent: discountPercent,
          amountAvailable: amountAvailable,
          created: created,
          averageRating: rating,
          ratingCount: ratingCount,
          categories: [],
          hashTags: [],
          images: localImages != null && localImages.isNotEmpty
              ? localImages
                  .map((localAddress) => CommerceImage(
                      0, localAddress, 'image of $title',
                      isLocal: true))
                  .toList(growable: false)
              : [],
          selectableAttributes: productAttributes ??
              [
                colors != null && colors.isNotEmpty
                    ? ProductAttribute(id: 0, name: 'color', options: colors)
                    : null,
                sizes != null && sizes.isNotEmpty
                    ? ProductAttribute(id: 1, name: 'size', options: sizes)
                    : null
              ].where((element) => element != null).toList());

  FakeProduct changeIsFavorite(bool isFavoriteValue) {
    return FakeProduct(
        id: id,
        title: title,
        shortDescription: shortDescription,
        description: description,
        isFavorite: isFavoriteValue,
        price: price,
        discountPercent: discountPercent,
        amountAvailable: amountAvailable,
        created: created,
        rating: averageRating,
        ratingCount: ratingCount,
        productAttributes: selectableAttributes);
  }
}
