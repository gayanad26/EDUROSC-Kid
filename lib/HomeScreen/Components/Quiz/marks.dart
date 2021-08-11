import 'package:flutter/material.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/home.dart';
import 'package:e_companion/HomeScreen/Components/Quiz/resultpage.dart';

class Mark extends StatefulWidget {
  Mark({Key key, this.mark});

  final int mark;
  

  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  
  @override
  Widget build(BuildContext context) {
    print(widget.mark);
    int score = widget.mark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        
        body: Column(
          children: <Widget>[
             Padding(padding: EdgeInsets.all(30.0)),
             
            SizedBox(height: 10),
            Text(
              "Mark: "+score.toString(),
              style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );



    
    
    
    
    // to use state class values you need to use the widget as the parent class object
    // return Container(
    // );
  }
}