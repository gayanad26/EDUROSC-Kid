import 'package:e_companion/constants.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Syllabus extends StatefulWidget {
  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // backgroundColor: Color(0xFFFCFAF8),
      backgroundColor: kPrimaryLightColor,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Chapter 1', "https://www.youtube.com/watch?v=up_yL6J4hCs", 'assets/images/english.jpg', false, context),
                // _buildCard('Chapter 2', "https://www.youtube.com/watch?v=up_yL6J4hCs", 'assets/images/maths.jpg', false, context),
                // _buildCard('Chapter 3', "https://www.youtube.com/watch?v=up_yL6J4hCs", 'assets/images/science.jpg', false, context),
                // _buildCard('Chapter 4',  "https://www.youtube.com/watch?v=up_yL6J4hCs", 'assets/images/science.jpg', false, context),
                // _buildCard("Syllabus Copy","", 'assets/images/english.jpg', false, context),
                // _buildCard("TextBook","https://drive.google.com/file/d/1Cg3QPCjGKx1Mt1QDGzLcOjTJm4KLX31J/view", 'assets/images/english.jpg', false, context),
              ],
            )
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String Chaptername, String ytlink, String imgPath, bool added, context) {
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
                  SizedBox(height: 45.0),
                  
                  Text(Chaptername, style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
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
  Widget customcard(String langname, String ytlink, String image){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () async{
          String url = ytlink;
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Material(
          color: kPrimaryColor,
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
}