
import 'package:e_companion/HomeScreen/HomeScreen.dart';
import 'package:e_companion/LoginSignUp/Login.dart';
import 'package:e_companion/LoginSignUp/SignUp.dart';
import 'package:e_companion/LoginSignUp/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());
   }

//User firebaseUser = FirebaseAuth.instance.currentUser;
  //Widget firstWidget;
  // if(firebaseUser !=null)
  //   {
  //   firstWidget = HomeScreen();
  //   }
  //   else{
  //   firstWidget= Start();
  //   }

  
  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future <void> main() async {
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   var isLoggedIn = (prefs.getBool('isLoggedIn')==null) ? false: prefs.getBool('isLoggedIn');
    
    return MaterialApp(
      

      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      
      home: 
      HomeScreen(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
      },
      
    );
    
  }
}



