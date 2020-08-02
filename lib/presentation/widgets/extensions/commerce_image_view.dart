import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/model/commerce_image.dart';

extension View on CommerceImage {
  ImageProvider getView() {
    if (isLocal) {
      return AssetImage(
        address,
      );
    } else {
      return NetworkImage(
        address,
      );
    }
  }
}
