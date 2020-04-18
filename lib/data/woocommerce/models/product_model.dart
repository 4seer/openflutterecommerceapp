
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/product/product_entity.dart';

class ProductModel extends ProductEntity {

  ProductModel(
    {@required int id,
    @required title,
    @required description,
    @required image,
    @required thumb,
    parentId,
    orderNumber,
    count}) : super(
      id: id, 
      title: title,
      description: description,
      image: image,
      thumb: thumb
    );
      
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num).toInt(), 
      title: json['name'],
      description: json['description'],
      image: json['image']!=null ? json['image']['src'] : '',
      thumb: json['image']!=null ? json['image']['src'] : '',
      parentId: (json['parent'] as num).toInt(), 
      orderNumber: (json['menu_order'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'name': title,
      'description': description,
      'image': {
        'src': image,
      }
    };
  }
}
