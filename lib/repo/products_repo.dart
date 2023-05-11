import 'dart:convert';

import 'package:byjus_network/api_services.dart';
import 'package:flutter/cupertino.dart';

import '../bloc/products_bloc.dart';
import '../models/products_model.dart';

class ProductsRepo {
  Future<List<ProductsModel>> getProducts() async {
    var response = await ApiClient().get('https://fakestoreapi.com/products');
    debugPrint("response   ${jsonEncode(response).runtimeType}");
    final List<ProductsModel> productsModel = productsModelFromJson(jsonEncode(response));
    debugPrint("total product: ${productsModel.length}");
    debugPrint("total product: ${productsModel[0].title}");
    return productsModel;
  }
}