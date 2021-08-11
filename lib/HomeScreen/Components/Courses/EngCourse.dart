// import 'package:e_companion/HomeScreen/Components/Courses/Syllabus.dart';
import 'package:e_companion/constants.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class EngCourse extends StatefulWidget {
  @override
  _EngCourseState createState() => _EngCourseState();
}

class _EngCourseState extends State<EngCourse> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // backgroundColor: Color(0xFFFCFAF8),
      appBar: AppBar(
        title: Text("English Course", style: TextStyle(fontFamily: "Quando"),),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0, left: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildCard('Chapter 1', '\nA Happy Child', "https://youtu.be/up_yL6J4hCs", 'assets/images/english.jpg', false, context),
                _buildCard('Chapter 2', '\nThree Little Pigs',"https://youtu.be/6U92SgaMT5s", 'assets/images/english.jpg', false, context),
                _buildCard('Chapter 3', '\nAfter A Bath', "https://youtu.be/g2b5B8MTQcU", 'assets/images/english.jpg', false, context),
                _buildCard('Chapter 4', '\nOne Little Kitten', "https://www.youtube.com/watch?v=8oMtsuiirDo", 'assets/images/english.jpg', false, context),
                _buildCard("Syllabus Copy", '', "https://byjus.com/cbse-class-1-english-syllabus/", 
                'assets/images/english.jpg', false, context),
                _buildCard("TextBook",'',"https://www.vedantu.com/ncert-books/ncert-books-class-1", 'assets/images/english.jpg', false, context),
              ],
            )
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String Chapterno, String Chaptername, String ytlink, String imgPath, bool added, context) {
        return Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
            onTap: () async{
              String url = ytlink;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
                ],
                color: Colors.white
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        
                    )
                  ),
                  // Hero(
                  //   tag: imgPath,
                  //   child: Container(
                  //     height: 75.0,
                  //     width: 75.0,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage(imgPath),
                  //         fit: BoxFit.contain
                  //       )
                  //     )
                  //   )
                  // ),
                  SizedBox(height: 35.0),
                  Text(Chapterno, style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(Chaptername, style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      // fontWeight: FontWeight.bold
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      color: Color(0xFFEBEBEB), 
                      height: 1.0
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Tap to view', style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontSize: 12.0
                            )
                          )
                        ],
                      // ]
                    )
                  )
                ]
              )
            )
          )
        );
  }
}


