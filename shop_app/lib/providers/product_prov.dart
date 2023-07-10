import 'dart:convert';

import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/secreens/cons_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class product_prove extends ChangeNotifier {
  List<product_model> list_products = [];

  getproduct({required var id_classs_shoes}) async {
    final response = await http.post(
        Uri.parse("${cons_values.BASEURL}products.php"),
        body: {"id_classs_shoes": id_classs_shoes});
    if (response.statusCode == 200) {
      var jsonbody = jsonDecode(response.body);
      var sub_category = jsonbody['sub_category'];
      for (Map i in sub_category) {
        list_products.add(product_model(
            id: i['id'],
            price: i['price'],
            size: i['size'],
            quality: i['quality'],
            description: i['description'],
            kind: i['kind'],
            image_url: i['image_url'],
            id_classs_shoes: i['id_classs_shoes']));
      }
      notifyListeners();
    }
  }
}
