import 'package:e_companion/HomeScreen/Components/Courses/EngCourse.dart';
import 'package:e_companion/HomeScreen/Components/Courses/MathCourse.dart';
import 'package:e_companion/HomeScreen/Components/Courses/SciCourse.dart';
import 'package:e_companion/constants.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // child: Text('this is course tab',style: TextStyle(color: Colors.black),),
          child: Column(children: [
            
            SubjectCard("English", MediaQuery.of(context).size.width),
            SubjectCard("Maths", MediaQuery.of(context).size.width),
            SubjectCard("Science", MediaQuery.of(context).size.width),
            
            
          ]),
        ),
      ),
    );
  }


  Widget SubjectCard(String subject, double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: () async{
          if(subject == "English" ){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => EngCourse(),
            ));
          }
          else if(subject == "Maths"){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => MathCourse(),
            ));
          }
          else{
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SciCourse(),
            ));
          }
        },
      
        child: Container(
          alignment: Alignment(0.0, 0.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                Colors.blueGrey[900],
                Colors.white,
              ],
            ),
          ),
          width: width,
          height: 130,
          child: Text(
            '$subject',
            style: TextStyle(color: Colors.black, fontSize: 32.0, fontFamily: "Quando",),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

