import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';

class CommerceImageView extends StatelessWidget {
  final CommerceImage commerceImage;

  const CommerceImageView(
    this.commerceImage, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (commerceImage.isLocal) {
      return Image.asset(commerceImage.address);
    } else {
      return Image.network(commerceImage.address);
    }
  }
}
