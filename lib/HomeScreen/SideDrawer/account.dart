import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_companion/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggedin= false;
  User user;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }
  
  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // backgroundColor: Color(0xFFFCFAF8),
      appBar: AppBar(
        title: Text("Personal Info", style: TextStyle(fontFamily: "Quando"),),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: 
      !isloggedin
          ? CircularProgressIndicator()
          : ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0, left: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 1,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildCard('assets/images/side.png','${user.displayName}', 'Class: ${user.photoURL}', '${user.email}', false, context),
              ],
            )
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String imgPath, String Chaptername, String classnum, String email, bool added, context) {
        return Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
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
                  
                  SizedBox(height: 15.0),
                  Hero(
                    tag: imgPath,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.contain
                        )
                      )
                    )
                  ),
                  SizedBox(height: 35.0),
                  Text(Chaptername, style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Varela',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 5.0),
                  Text(classnum, style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      // fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 5.0),
                  Text(email, style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      // fontWeight: FontWeight.bold
                    )
                  ),
                ]
              )
            )
          )
        );
  }
}




  
/*class _AccountState extends State<Account> {
  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Info", style: TextStyle(fontFamily: "Quando"),),
      ),
      body: (
       !isloggedin
          ? CircularProgressIndicator()
          : ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0, left: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 1,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.0,
              children: <Widget>[
                _buildCard('assets/images/english.jpg', false, context),
                
              ],
            )
          ),
          SizedBox(height: 15.0)
        ],
      )
      ),
    );

  }

  Widget _buildCard(String imgPath, bool added, context) {
        
            Container(
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
                  
                  Text('${user.displayName}', style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontFamily: 'Quando',
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
                          Text('Class ${user.photoURL}', style: TextStyle(
                              fontFamily: 'Quando',
                              color: Color(0xFFD17E50),
                              fontSize: 12.0
                            )
                          )
                        ],
                      // ]
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
                          Text('${user.email}', style: TextStyle(
                              fontFamily: 'Quando',
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
           
        );
  }
}*/