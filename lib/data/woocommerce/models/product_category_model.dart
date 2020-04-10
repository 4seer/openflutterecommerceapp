
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/domain/entities/product/product_category_entity.dart';

class ProductCategoryModel extends ProductCategoryEntity {

  ProductCategoryModel(
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
      thumb: thumb,
      parentId: parentId,
      orderNumber: orderNumber,
      count: count
    );
      
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
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
      'parent': parentId,
      'description': description,
      'image': {
        'src': image,
      },
      'menu_order': orderNumber,
      'count': count
    };
  }
}
