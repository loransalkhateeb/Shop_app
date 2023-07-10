import 'package:ecommerce_project/providers/kinds_prov.dart';
import 'package:ecommerce_project/secreens/welcome_secreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/kindsprov2.dart';

class onboarding_secreen extends StatefulWidget {
  const onboarding_secreen({Key? key}) : super(key: key);

  @override
  State<onboarding_secreen> createState() => _onboarding_secreenState();
}

class _onboarding_secreenState extends State<onboarding_secreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<kinds_prov>(context, listen: false).getkinds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff272727),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset("images/img2.png")),
              const SizedBox(
                height: 90,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset("images/img3.png")),
              const SizedBox(
                height: 50,
              ),
             Padding(padding: const EdgeInsets.all(0.8),
             child: Padding(
               padding: const EdgeInsets.only(left: 50),
               child: SizedBox(
                 width: 300,
                 height: 350,
                 child: Consumer<kinds_prov>(
                   builder: (context, value, child) {
                     return GridView.builder(
                         itemCount: value.list_kinds_prov.length,
                         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                           maxCrossAxisExtent: 200,
                             crossAxisSpacing: 20,
                             mainAxisSpacing: 20,
                         ) ,
                         itemBuilder: (context,index){
                           return InkWell(
                             onTap: (){
                             },
                             child: Container(
                               width: 151,
                               // margin: EdgeInsets.only(bottom: 20),
                               height: 151,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(4),
                                   color: const Color(0xff3D3D3D)
                               ),
                               child: Center(
                                 child: Text(value.list_kinds_prov[index].kind_shoes,
                                   style: const TextStyle(color: Colors.white,fontSize: 20),
                                 ),
                               ),
                             ),
                           );
                         });
                   },
                 ),
               ),
             )
             ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: SizedBox(
                  width: 324,
                  height: 66,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEC4156),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15))),
                      onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const welcome_secreen()),
                         );
                      },
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xffFFFFFF)),
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
