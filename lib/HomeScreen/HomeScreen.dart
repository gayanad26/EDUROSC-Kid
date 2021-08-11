import 'package:e_companion/HomeScreen/Components/Courses/Course.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/home.dart';
// import 'package:e_companion/HomeScreen/Components/Quiz/views/homepage.dart';
import 'package:e_companion/HomeScreen/Components/chatWindow.dart';
import 'package:e_companion/HomeScreen/SideDrawer/SideDrawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:e_companion/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Container(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "E-Companion",
              style: TextStyle(color: Colors.white,
              fontSize: 20.0, fontFamily: "Quando",),
            ),
          ),
        ),
      ),
      body: _currentIndex == 2
          ? ChatPage()
          : _currentIndex == 0
              ? Courses()
              : Quizhome(),
      //body: if(_currentIndex==2){}

      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Colors.blueGrey[900],
        animationDuration: Duration(milliseconds: 250),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blueGrey[900],
        height: 50,
        items: [
          Icon(Icons.video_call, color: Colors.white,),
          Icon(Icons.fact_check, color: Colors.white,),
          Icon(Icons.chat, color: Colors.white,)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          debugPrint("Current Index is $index");
        },
      ),
    );
  }
}
