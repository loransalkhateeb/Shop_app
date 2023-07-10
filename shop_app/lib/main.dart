import 'package:ecommerce_project/providers/banner_images_prov.dart';
import 'package:ecommerce_project/providers/kinds_prov.dart';
import 'package:ecommerce_project/providers/kindsprov2.dart';
import 'package:ecommerce_project/providers/model_prov.dart';
import 'package:ecommerce_project/providers/product_prov.dart';
import 'package:ecommerce_project/secreens/product2.dart';
import 'package:ecommerce_project/secreens/splashsecreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<kinds_prov>(
          create: (_) => kinds_prov(),
        ),
         ChangeNotifierProvider<kinds_prov2>(
           create: (_) => kinds_prov2(),
         ),
         ChangeNotifierProvider<BannerProv>(
           create: (_) => BannerProv(),
         ),
         ChangeNotifierProvider<model_prov>(
           create: (_) => model_prov(),
         ),
        ChangeNotifierProvider<product_prove>(
          create: (_) => product_prove(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: splashsecreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}