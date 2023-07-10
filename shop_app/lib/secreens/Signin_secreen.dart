import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'cons_values.dart';
import 'main_secreen.dart';

class signin_secreen extends StatefulWidget {
  const signin_secreen({Key? key}) : super(key: key);

  @override
  State<signin_secreen> createState() => _signin_secreenState();
}

class _signin_secreenState extends State<signin_secreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isshowemail = false;
    bool isshowpassword = false;
    bool less = false;
    return Scaffold(
        backgroundColor:  Color(0xff272727),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: SingleChildScrollView(
                physics:  BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                    margin:  EdgeInsets.all(40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Image(image: AssetImage("images/img2.png")),
                           SizedBox(
                            height: 50,
                          ),
                          Container(
                              width: 336,
                              height: 546,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                     Text(
                                      "S I G N    I  N",
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 24,
                                      ),
                                    ),
                                     SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 336,
                                      height: 315,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                           Text(
                                            "Email",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                           SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: TextFormField(
                                              controller: _email,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Email is required";
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                  errorText: isshowemail
                                                      ? "Req"
                                                      : null,
                                                  hintText: "Enter your Email",
                                                  hintStyle:  TextStyle(
                                                      color:
                                                          Color(0xffB1B2B2))),
                                            ),
                                          ),
                                           SizedBox(
                                            height: 30,
                                          ),
                                           Text(
                                            "Password",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                           SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "The Password is required";
                                                }
                                              },
                                              controller: _password,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  errorText: isshowpassword
                                                      ? "Req"
                                                      : null,
                                                  hintText: "************",
                                                  hintStyle:  TextStyle(
                                                      color:
                                                          Color(0xffB1B2B2))),
                                            ),
                                          ),
                                           SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: SingleChildScrollView(
                                              child: Text(
                                                "Forgot Password?",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xffD9D9D9)),
                                              ),
                                            ),
                                          ),
                                           SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: SingleChildScrollView(
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                      value: less,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          less = val!;
                                                        });
                                                      }),
                                                   SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Remember Me",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffD6D6D6),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 39,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                 Color(0xffEC4156)),
                                        onPressed: () {
                                          if (key.currentState!.validate()) {
                                            login();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  main_secreen()),
                                            );
                                          }
                                        },
                                        child:  Text(
                                          "SIGN IN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFFFFFF)),
                                        ),
                                      ),
                                    ),
                                     SizedBox(
                                      height: 35,
                                    ),
                                     Text(
                                      "- OR -",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                     SizedBox(
                                      height: 40,
                                    ),
                                     Text(
                                      "SIGN IN WITH",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("Lorans Alkhateeb");
                                  },
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/img7.png"),
                                    maxRadius: 30,
                                    minRadius: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    print("Yazan Alkhateeb");
                                  },
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/img6.png"),
                                    maxRadius: 30,
                                    minRadius: 30,
                                  ),
                                ),
                              ]),
                           SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                               Text(
                                "Dont have an Account?",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 17,
                                    letterSpacing: 2),
                              ),
                               SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child:  Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2),
                                  ))
                            ],
                          )
                        ]))),
          ),
        ));
  }

  login() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
        Uri.parse(
          "http://192.168.100.10/flutter_project3/signup.php",
        ),
        body: {"email": _email.text, "pass": _password.text});
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonbody = jsonDecode(response.body);
      if (jsonbody['result']) {
        Navigator.of(context);
      }
      else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(Icons.error),
              content: Text(jsonbody['msg']),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
