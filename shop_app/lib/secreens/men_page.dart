import 'package:ecommerce_project/providers/product_prov.dart';
import 'package:ecommerce_project/secreens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/kinds_model.dart';
import '../providers/banner_images_prov.dart';
import '../providers/model_prov.dart';

class men_page extends StatefulWidget {
  kinds_model kind;
  var classs;
  var id_kind_shoes;
  men_page({ required this.id_kind_shoes,required this.classs,required this.kind});
  @override
  State<men_page> createState() => _men_pageState();
}

class _men_pageState extends State<men_page> {
  @override
  void initState() {
    super.initState();
    Provider.of<BannerProv>(context, listen: false)
        .getBannerImages(classs: "Men", id_kinds_shoes: "1");
    Provider.of<model_prov>(context, listen: false)
        .getmodelclasss(classs: widget.classs, id_kind_shoes: widget.id_kind_shoes,kind:widget.kind);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272727),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Just Arrived",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: 'Open Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset("images/img8.png")
                ],
              ),
            ),
            Container(
              width: 428,
              height: 220,
              child: Consumer<BannerProv>(
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.listBannerImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print("LOrans");
                          },
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 160,
                                  height: 240,
                                  child: Image.network(
                                    value.listBannerImages[index].image_url,
                                    width: 160,
                                    height: 240,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )),
                        );
                      });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Shuffle up,",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'Open Sans'),
                  ),
                  Text(
                    " just like your playlist",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontFamily: 'Open Sans'),
                  )
                ],
              ),
            ),
            // SizedBox(height: 25,)
            Container(
              width: 370,
              height: 400,
              padding: EdgeInsets.all(8),
              child: Consumer<model_prov>(
                builder: (context,value,child){
                  return ListView.builder(
                      itemCount: value.listmodelclasss.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return product_page(
                                    id_classs_shoes: value.listmodelclasss[index].id,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(value.listmodelclasss[index].image_url,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                               SizedBox(width: 17,),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(value.listmodelclasss[index].kind,
                                       style: TextStyle(color: Color(0xffFCFCFC),
                                           fontSize: 14,
                                         fontStyle: FontStyle.normal,
                                         fontFamily: 'Lora',
                                         fontWeight: FontWeight.w600
                                       ),
                                     ),

                                   SizedBox(height: 6,),
                                   Text(value.listmodelclasss[index].description,
                                     style: TextStyle(
                                         color: Color(0xffBCBCBC),
                                         fontSize: 14,
                                         fontStyle: FontStyle.normal,
                                         fontFamily: 'Lora',
                                         fontWeight: FontWeight.w600
                                     ),
                                   ),
                                   Text(value.listmodelclasss[index].quality,
                                     style: TextStyle(color: Colors.white,
                                         fontSize: 12,
                                       fontWeight: FontWeight.w500
                                     ),
                                   ),
                                   Text(value.listmodelclasss[index].price.toString(),
                                     style: TextStyle(color: Colors.white,
                                         fontSize: 12,
                                         fontWeight: FontWeight.w500
                                     ),
                                   ),
                                 ],
                               ),
                                SizedBox(width: 10,),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 70),
                                    child: SizedBox(
                                      child: Icon(Icons.favorite,color: Colors.grey,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                  });
                },
              ),
            ),
            SizedBox(height: 40,),
            Text(widget.kind.kind_shoes,style: TextStyle(color: Colors.white,fontSize: 50),)
          ],
        ),
      ),
    );
  }
}
