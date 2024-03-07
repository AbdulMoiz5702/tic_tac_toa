import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ButtomScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 5 seconds then navigate to the next screen
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> BottomScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height *0.5,
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/tic.png'),fit: BoxFit.contain,isAntiAlias: true,),
          ),
        )
      ),
    );
  }
}