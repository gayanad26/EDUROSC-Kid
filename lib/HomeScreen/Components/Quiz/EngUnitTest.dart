import 'package:e_companion/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/quizpage.dart';

class EngUnit extends StatefulWidget {
  @override
  _EngUnitState createState() => _EngUnitState();
}

class _EngUnitState extends State<EngUnit> {

  Color bg = Colors.blueGrey[900];

  List<String> images = [
    "assets/images/english.jpg",
    "assets/images/english.jpg",
    "assets/images/english.jpg",
  ];

  List<String> des = [
    "English is a beautiful language",
    "Maths is fun with numbers",
    "Science to be curious",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: bg,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(                    // changing from 200 to 150 as to look better
                        height: 60.0,
                        width: 60.0,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w700,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("English Unit Tests", style: TextStyle(fontFamily: "Quando"),),
      ),
      body: Column(
        children: [
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     width: double.infinity,
          //     decoration: new BoxDecoration(
          //       color: bg,
          //       boxShadow: [
          //         new BoxShadow(blurRadius: 10.0)
          //       ],
          //       borderRadius: new BorderRadius.vertical(
          //           bottom: new Radius.elliptical(
          //               MediaQuery.of(context).size.width, 140.0)),
          //     ),
          //     alignment: Alignment.center,
          //     child: Center(
          //       // child: Text(
          //       //   "English Unit Test",
          //       //   style: TextStyle(
          //       //     fontSize: 25.0,
          //       //     fontFamily: "Quando",
          //       //     color: Colors.white,
          //       //   ),
          //       // ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 50.0),
          Expanded(
            flex: 6,
            child: ListView(
              children: <Widget>[
                customcard("A Happy Child", images[0], des[0]),
                customcard("Three Little Pigs", images[1], des[1]),
                customcard("After A Bath", images[2], des[2]),
              ],
            ),
          ),
        ],
      ),


    );
  }
}