import 'dart:async';

import 'package:bukin/WebSer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartState();
  }

}

class StartState extends State<Splash>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration=Duration(seconds: 5);
    return Timer(duration, callback);


  }
  callback(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => WebUse()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(120),
                  child:Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.grey,
                      child: Image.asset('images/bukinlogo.png'),)
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}



