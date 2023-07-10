import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_secreen.dart';
class splashsecreen extends StatefulWidget {
  const splashsecreen({Key? key}) : super(key: key);

  @override
  State<splashsecreen> createState() => _splashsecreenState();
}

class _splashsecreenState extends State<splashsecreen> {
  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const onboarding_secreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272727),
      body:Center(
        child: Image(
          image: AssetImage("images/img1.png"),
        ),
      ),
    );
  }
}
