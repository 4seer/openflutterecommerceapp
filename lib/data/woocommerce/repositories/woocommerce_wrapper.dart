
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openflutterecommerce/config/server_addresses.dart';
import 'package:openflutterecommerce/data/error/exceptions.dart';

abstract class WoocommercWrapperAbastract{
   Future<List<dynamic>> getCategoryList({int parentId=0});
   Future<List<dynamic>> getProductList({int categoryId=0});
}

class WoocommerceWrapper implements WoocommercWrapperAbastract{
  
  final http.Client client;

  WoocommerceWrapper({@required this.client});

  @override
  Future<List<dynamic>> getProductList({int categoryId=0}){
    return _getApiRequest(ServerAddresses.products);
  }
  @override
  Future<List<dynamic>> getCategoryList({int parentId=0}){
    return _getApiRequest(ServerAddresses.productCategories);
  }
  
  Future<List<dynamic>> _getApiRequest(String url) async {
    final response = await client.get(
      ServerAddresses.serverAddress + url + '?'+ServerAddresses.woocommerceKeys,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpRequestException();
    }
  }
}