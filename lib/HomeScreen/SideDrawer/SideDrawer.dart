import 'package:e_companion/HomeScreen/SideDrawer/About/Developers.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Reminder/store/AppState.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Todo/page/home_page.dart';
import 'package:e_companion/HomeScreen/SideDrawer/account.dart';
import 'package:e_companion/LoginSignUp/Start.dart';
import 'package:e_companion/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'About/Developers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Todo/provider/todos.dart';
import 'package:redux/redux.dart';
// import 'package:e_companion/HomeScreen/Components/Quiz/marks.dart';

Store<AppState> store;

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
  }
  
  
class _SideDrawerState extends State<SideDrawer> {


  //final _auth = FirebaseAuth.instance;
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
  //final  _user = _auth.currentUser();
   
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: !isloggedin
          ? CircularProgressIndicator()
          : Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey[900],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/side.png'),
                              fit: BoxFit.fill)
                              )
                   ),
                  Text(
                    '${user.displayName}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: "Quando"
                    )
                  ),
                  
                ],
              ),
            ),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title: Text('Account',style: TextStyle(fontSize: 17.0, fontFamily: "Quando"),),
            onTap: (){
              print("called account info");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
            },
          ),
          ListTile(
            leading:Icon(Icons.contact_mail),
            title: Text('To-do',style: TextStyle(fontSize: 17.0, fontFamily: "Quando"),),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => TodosProvider(),
                    child: HomePage(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading:Icon(Icons.photo_album_outlined),
            title: Text('Developers',style: TextStyle(fontSize: 17.0, fontFamily: "Quando"),),
            onTap: (){
              print('Button pressed');
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Developers()));
            },
          ),
          ListTile(
            leading:Icon(Icons.logout),
            title: Text('Logout',style: TextStyle(fontSize: 17.0, fontFamily: "Quando"),),
            onTap: (){
              FirebaseAuth.instance
              .signOut()
              .then((value) => 
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()))
              );
            },
          )
        ],
      ),
    );
  }
}
