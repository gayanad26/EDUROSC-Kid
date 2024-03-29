import 'dart:async';
import 'package:flutter/material.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  Color bg = Color.fromRGBO(28, 120, 223, 1);
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Quizhome(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Center(
              child: Image(
                image: AssetImage("images/icon.png"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Quizpops",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontFamily: "Satisfy",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}