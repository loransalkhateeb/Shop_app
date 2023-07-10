import 'dart:convert';

import 'package:ecommerce_project/models/const_values.dart';
import 'package:ecommerce_project/models/kinds_model.dart';
import 'package:ecommerce_project/secreens/cons_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/classs_kinds.dart';

class model_prov extends ChangeNotifier{
  List<model_classs_kinds> listmodelclasss = [];

  getmodelclasss({required var classs, required id_kind_shoes, required kinds_model kind}) async {
    final response = await http.post(
        Uri.parse("${cons_values.BASEURL}men_kinds.php"
        ),
      body: {
        "classs":classs,
        "id_kind_shoes":id_kind_shoes
      }
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var classes_shoes = jsonBody["classes_shoes"];
      for (Map i in classes_shoes) {
        listmodelclasss.add(model_classs_kinds(
        id: i['id [int]'],
          image_url: i['image_url'],
          classs: i['classs'],
          description: i['description'],
          id_kind_shoes: i['id_kinds_shoes'],
           kind: i['kind'],
          price: i['price'],
          quality: i['quality']
        ));
      }
      notifyListeners();
    }
  }

}