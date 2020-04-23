
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/domain/entities/product/product_entity.dart';

class ProductModel extends ProductEntity {

  ProductModel(
    {@required int id,
    @required title,
    @required description,
    @required images,
    @required thumb,
    @required selectableAttributes,
    categoryId,
    orderNumber,
    count}) : super(
      id: id, 
      title: title,
      description: description,
      selectableAttributes: selectableAttributes,
      images: images,
      thumb: thumb
    );
      
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] as num).toInt(), 
      title: json['name'],
      description: json['description'],
      images: json['image']!=null ? [json['image']['src']] : [],
      thumb: json['image']!=null ? json['image']['src'] : '',
      //TODO: add all categories related to product
      categoryId: json['categories']!=null? (json['categories'][0]['id'] as num).toInt():0, 
      orderNumber: (json['menu_order'] as num).toInt(),
      selectableAttributes: _getSelectableAttributesFromJson(json)
    );
  }

  static List<ProductAttribute> _getSelectableAttributesFromJson(Map<String, dynamic> json){
    List<ProductAttribute> selectableAttributes = [];
    if ( json['attributes']!= null ) {
       for (var attribute in json['attributes']) {
        selectableAttributes.add(
          ProductAttribute(
            id: attribute['id']??0,
            name: attribute['name']??'',
            options: List<String>.from(attribute['options'])
          )
        );
      }
    }
    return selectableAttributes;
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id, 
      'name': title,
      'description': description,
      'image': {
        'src': images.isNotEmpty?images[0]:'',
      }
    };
  }
}
