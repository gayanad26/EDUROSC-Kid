import 'package:e_companion/HomeScreen/HomeScreen.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Todo/page/home_page.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Todo/provider/todos.dart';
import 'package:e_companion/LoginSignUp/Login.dart';
import 'package:e_companion/LoginSignUp/SignUp.dart';
import 'package:e_companion/LoginSignUp/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
      ),
        
      home: Login(),
      routes: <String,WidgetBuilder>{
        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
      },
    ),
  ); 
}