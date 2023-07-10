import 'dart:convert';

import 'package:ecommerce_project/models/const_values.dart';
import 'package:ecommerce_project/secreens/cons_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/kinds_model.dart';

class kinds_prov extends ChangeNotifier {
  List<kinds_model> list_kinds_prov = [];

  getkinds() async {
    final respons = await http.get(
      Uri.parse("${cons_values.BASEURL}kinds_shoes.php"),
    );
    if (respons.statusCode == 200) {
      var jsonbody = jsonDecode(respons.body);
      var kinds = jsonbody['kinds'];
      for (Map i in kinds) {
        list_kinds_prov
            .add(kinds_model(id: i['id'], kind_shoes: i['kind_shoes']));
      }
      notifyListeners();
    }
  }
}
