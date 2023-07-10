import 'package:ecommerce_project/secreens/Signin_secreen.dart';
import 'package:ecommerce_project/secreens/main_secreen.dart';
import 'package:flutter/material.dart';
class welcome_secreen extends StatefulWidget {
  const welcome_secreen({Key? key}) : super(key: key);

  @override
  State<welcome_secreen> createState() => _welcome_secreenState();
}

class _welcome_secreenState extends State<welcome_secreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            width: 10000,
            height: 2000,
            child: ClipRect(
              child: Image(
                image: AssetImage("images/img5.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Image(image: AssetImage("images/img2.png"))),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 550),
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Color(0xffD6D6D6),
                              style: BorderStyle.solid
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff272727),
                            ),
                            onPressed: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) =>  main_secreen()),
                              );
                            },
                            child: Text(
                              "Skip",
                              style:
                              TextStyle(color: Color(0xffAFAFAF), fontSize: 20),
                            )),
                      ),
                      SizedBox(width: 10,),


                      Container(
                        margin: EdgeInsets.only(top: 550),
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Color(0xffD6D6D6),
                              style: BorderStyle.solid
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffEC4156),
                            ),
                            onPressed: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => const signin_secreen()),
                               );
                            },
                            child: Text(
                              "Sign in",
                              style:
                              TextStyle(color: Color(0xffAFAFAF), fontSize: 20),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
