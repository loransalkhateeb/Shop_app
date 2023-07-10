import 'package:ecommerce_project/providers/product_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class product2 extends StatefulWidget {
  // var id_classs_shoes;
  //
  // product2({required this.id_classs_shoes});

  @override
  State<product2> createState() => _product2State();
}

class _product2State extends State<product2> {
  @override
  void initState() {
    super.initState();
    Provider.of<product_prove>(context, listen: false)
        .getproduct(id_classs_shoes:"1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff272727),
        body: Consumer<product_prove>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.list_products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Text(value.list_products[index].kind,
                    style: TextStyle(color: Colors.white),
                    )
                  );
                });
          },
        ));
  }
}
