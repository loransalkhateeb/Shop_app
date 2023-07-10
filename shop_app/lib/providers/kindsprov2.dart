import 'dart:convert';

import 'package:ecommerce_project/models/const_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/kinds_model.dart';
import '../models/kinds_model2.dart';

class kinds_prov2 extends ChangeNotifier {
  List<kinds_model2> list_kinds_prov2 = [];

  getkinds2() async {
    final respons =
    await http.get(Uri.parse("${const_values.BASEURL}kinds_shoes2.php"),
    );
    if(respons.statusCode==200){
      var jsonbody=jsonDecode(respons.body);
      var kinds=jsonbody['kinds'];
      for(Map i in kinds){
        list_kinds_prov2.add(
            kinds_model2(id: i['id'], kind_shoes: i['kind_shoes'])
        );
      }
      notifyListeners();
    }
  }
}
