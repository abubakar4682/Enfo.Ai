import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/bottom_navigation.dart';
import 'login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>  BottomPage(),
        ),
      );
    });
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: deviceWidth,
          height: deviceHeight,
          color: Colors.white,
          child:Center(
            child:
            SizedBox(
              width:  738,
              height:  266,
              child: Image.asset('assets/images/enfologo.png'),

            ),
          ),
        ),
      ),
    );
  }
}
