import 'dart:convert';

import 'package:ecommerce_project/secreens/cons_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/banner_images_men.dart';

class BannerProv extends ChangeNotifier {
  List<banner_men> listBannerImages = [];

  getBannerImages({required var classs, required id_kinds_shoes}) async {
    final response = await http.post(
      Uri.parse("${cons_values.BASEURL}getbannerimages.php"
      ),
      body: {
        "classs":classs,
        "id_kinds_shoes":id_kinds_shoes
      }
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var banner_image = jsonBody["banner_image"];
      print("banner_image = ${banner_image}");
      for (Map i in banner_image) {
        listBannerImages.add(banner_men(
            id: i['id'],
            classs: i['classs'],
            id_kinds_shoes: i['id_kinds_shoes'],
            image_url: i['image_url']));
      }
      notifyListeners();
    }
  }
}
