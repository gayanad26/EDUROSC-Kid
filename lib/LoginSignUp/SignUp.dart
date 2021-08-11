import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/resultpage.dart';
import 'package:e_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_companion/LoginSignUp/Login.dart';
//import 'package:cloud_functions/cloud_functions.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name, _email, _password, _class;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/HomeScreen/HomeScreen.dart");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        User res  = user.user;
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name, photoURL: _class);
          await FirebaseFirestore.instance.collection("students")
          .doc(res.uid)
          .set({
            "name": _name,
            "class": _class,
            "email": _email,
            // "createdAt": FieldValue.serverTimestamp()
          });
          // resultpage(
          //     stuName: _name,
          //     mydata: 0,
          //     selected_awnser: 0,
          //     random_array: 0,
              
          // );
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR',
            style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange
                    )),
            
            content: Text(errormessage,
            style: TextStyle(
                      fontSize: 18,
                      color: kPrimaryColor
                    )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK',style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange
                    )))
            ],
          );
        });
  }
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image(
                image: AssetImage("assets/images/registration.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height:1.0),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Name';
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (input) => _name = input),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Class';
                          },
                          decoration: InputDecoration(
                              labelText: 'Class',
                              prefixIcon: Icon(Icons.school),
                              ),
                          onSaved: (input) => _class = input),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Email';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          onSaved: (input) => _email = input),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input.length < 6)
                              return 'Provide Minimum 6 Character';
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: signUp,
                      child: Text('SignUp',
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Text('Already have an account?'),
              onTap: navigateToLogin,
            )
          ],
        ),
      ),
    ));
  }
}
