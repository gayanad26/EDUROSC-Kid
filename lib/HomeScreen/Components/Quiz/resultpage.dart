import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_companion/HomeScreen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/home.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/reviewpage.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/marks.dart';

class resultpage extends StatefulWidget {
  var stuName;
  var random_array;
  var selected_awnser;
  var mydata;
  resultpage({Key key , @required this.stuName, @required this.mydata, @required this.selected_awnser, @required this.random_array}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(stuName, mydata, selected_awnser,random_array);
}

class _resultpageState extends State<resultpage> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggedin= false;
  User user;
  
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
    // String name = '${user.displayName}';
    // print(name);
  }
  

  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;
  int marks = 0;

  Color bg = Colors.blueGrey[900];

  @override
  void initState(){
    for(int j=0;j<10;j++){
      int i = random_array[j];
      String k = selected_awnser[j];
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
          marks = marks + 1;
      }
    }

    if(marks < 4){
      image = images[2];
      message = "You Should Try Hard!!\n" + "     You Scored $marks!!";
    }else if(marks < 8){
      image = images[1];
      message = "You Can Do Better!!\n" + "     You Scored $marks";
    }else{
      image = images[0];
      message = "You Did Very Well!!\n" + "     You Scored $marks";
    }
    super.initState();

    // final int score = marks;
  }
  var stuName;
  var random_array;
  var selected_awnser;
  var mydata;
  _resultpageState(this.stuName, this.mydata, this.selected_awnser, this.random_array);
  @override
  Widget build(BuildContext context) {

    
    
    
    CollectionReference score = FirebaseFirestore.instance.collection('students');   


    // Stream collectionStream = FirebaseFirestore.instance.collection('score').snapshots();
    // Stream documentStream = FirebaseFirestore.instance.collection('students').doc('uid').snapshots();

    Future<void> addMarks(){
      // Call the user's CollectionReference to add a new user
      return score
        .add({
            // 'name': stuName,
            'marks': marks,
          })
          .then((value) => print("Marks Added"))
          .catchError((error) => print("Failed to add marks: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "Result", style: TextStyle(fontFamily: "Quando"),
        ),
      ),
      body: 
      Column(children: 
        <Widget>[
          Expanded(flex: 5, child: 
            Container(child: 
              Column(children: 
                <Widget>[
                  SizedBox(height: 40.0,),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0,), child: 
                    Center(child: 
                      Text("Your Score ", style: TextStyle(fontSize: 28.0,fontFamily: "Quando",color: Colors.teal),),
                    )
                  ),
                  SizedBox(height: 20.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 40,),
                      Text("  :  "+marks.toString(), style: TextStyle(color: Colors.teal,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clear,color: Colors.red,size: 40,),
                      Text(" :  "+(10-marks).toString(),style: TextStyle(color: Colors.teal,fontSize: 20.0,fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.check,color: Colors.green,size: 40,),
                      Text(message,style: TextStyle(color: Colors.teal,fontSize: 20.0,),),
                    ],
                  ),
                ],
              ),
            ),            
          ),
          Expanded(child: 
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: 
              <Widget>[
                OutlineButton(color: Colors.teal,
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
                  },
                  child: Text("Home",style: TextStyle(fontSize: 18.0,color: Colors.teal,),),
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0,),
                  borderSide: BorderSide(width: 3.0, color: bg),
                  splashColor: bg,
                ),
                /*OutlineButton(color: Colors.teal,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => reviewpage(mydata: mydata, selected_awnser: selected_awnser, random_array:random_array),));
                  },
                  child: Text("Review Questions",style: TextStyle(fontSize: 18.0,color: Colors.teal,),),
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0,),
                  borderSide: BorderSide(width: 3.0, color: bg,),
                  splashColor: bg,
                ),*/
              ],
            ),
          ),
          
          /*Column(children: 
            <Widget>[
              OutlineButton(color: Colors.teal,
                onPressed: addMarks,
                /*onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Mark(mark: marks),),);
                
                  FirebaseFirestore.instance.collection('score').add({'score': marks}); //WORKING
                  // FirebaseFirestore.instance.collection('score').add({'name': user.displayName,'score': marks});
                },*/
                child: Text("Fetch Marks",style: TextStyle(fontSize: 18.0,color: Colors.teal,),),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0,),
                borderSide: BorderSide(width: 3.0, color: bg),
                splashColor: bg,
              ),
            ],
          ),*/
          Column(children: 
            <Widget>[
              OutlineButton(color: Colors.teal,
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => reviewpage(mydata: mydata, selected_awnser: selected_awnser, random_array:random_array),));
                  },
                  child: Text("Review Questions",style: TextStyle(fontSize: 18.0,color: Colors.teal,),),
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0,),
                  borderSide: BorderSide(width: 3.0, color: bg,),
                  splashColor: bg,
              ),
            ],
          ),
          SizedBox(height: 50.0),
        ],
        
      ),

    );
  }
}