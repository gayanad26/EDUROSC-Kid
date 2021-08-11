import 'package:e_companion/HomeScreen/SideDrawer/About/Ayesha.dart';
import 'package:e_companion/HomeScreen/SideDrawer/About/Gayana.dart';
import 'package:e_companion/HomeScreen/SideDrawer/About/Teja.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'Abhinav.dart';


class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animatable<Color> background = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.orange,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange,
          end: Colors.amber,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.amber,
          end: Colors.green,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.blue,
          end: Colors.purple,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.purple,
          end: Colors.pink,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.pink,
          end: Colors.red,
        ),
      ),
    ],
  );
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor:
                background.evaluate(AlwaysStoppedAnimation(_controller.value)),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: //Tooltip(
                            // message: 'Developers',
                            //waitDuration: Duration(milliseconds: 500),
                            //child:
                            Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Developers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 30, fontFamily: "Quando"),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: FlareActor("animations/dpbg.flr",
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        animation: "Alarm"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Abhinav()));
                                      },
                                                                          child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://i.imgur.com/LYTSM31.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                child: Text(
                                  'Abhinav \n Kumar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 200,
                            color: Colors.white,
                          ),
                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: FlareActor("animations/dpbg.flr",
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        animation: "Alarm"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Teja()));
                                      },
                                                                          child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://i.imgur.com/8Th4Iry.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                child: Text(
                                  'Tejashree R',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    //fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: FlareActor("animations/dpbg.flr",
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        animation: "Alarm"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Gayana()));},
                                                                          child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://i.imgur.com/QtYVyX4.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                child: Text(
                                  'Gayana D',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 200,
                            color: Colors.white,
                          ),
                          Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: FlareActor("animations/dpbg.flr",
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        animation: "Alarm"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(21.0),
                                    child: InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Ayesha()));},
                                                                          child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        elevation: 0,
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              'https://i.imgur.com/GBu1zxs.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                child: Text(
                                  '  Ayesha \n Sulthana',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}





//GestureDetector(
//   onTap: _launchURL,
//   child: Tooltip(
//             message: 'Email',
//             waitDuration: Duration(milliseconds: 500),
//             child: Card(
//     color: Colors.white,
//     elevation: 5,
//     child: Padding(
//       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Icon(
//             Icons.mail,
//             color: Colors.blueGrey[300],
//           ),
//           Text(
//             'maurya.abhay30@gmail.com',
//             style: TextStyle(color: Colors.blueGrey[300]),
//           )
//         ],
//       ),
//     ),
//   ),
// ),),

// GestureDetector(
//   onTap: _launchPhone,
//   child: Tooltip(
//             message: 'Phone',
//             waitDuration: Duration(milliseconds: 500),
//             child: Card(
//     color: Colors.white,
//     elevation: 5,
//     child: Padding(
//       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Icon(
//             Icons.phone,
//             color: Colors.blueGrey[300],
//           ),
//           Text(
//             '+91 9027398389',
//             style: TextStyle(color: Colors.blueGrey[300]),
//           )
//         ],
//       ),
//     ),
//   ),
// ),),

//Card(
//   color: Colors.white,
//   elevation: 5,
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         GestureDetector(
//           onTap: _launchLI,
//           child: Tooltip(
//             message: 'LinkedIn',
//             waitDuration: Duration(milliseconds: 500),
//             child:Icon(
//             FontAwesomeIcons.linkedin,
//             color: Colors.blueGrey[300],
//           ),),
//         ),
//         GestureDetector(
//           onTap: _launchGH,
//           child: Tooltip(
//             message: 'Github',
//             waitDuration: Duration(milliseconds: 500),
//             child:Icon(
//             FontAwesomeIcons.githubSquare,
//             color: Colors.blueGrey[300],
//           ),),
//         ),
//         GestureDetector(
//           onTap: _launchTW,
//           child: Tooltip(
//             message: 'Twitter',
//             waitDuration: Duration(milliseconds: 500),
//             child:Icon(
//             FontAwesomeIcons.twitterSquare,
//             color: Colors.blueGrey[300],
//           ),),
//         ),
//         GestureDetector(
//           onTap: _launchIG,
//           child: Tooltip(
//             message: 'Instagram',
//             waitDuration: Duration(milliseconds: 500),
//             child:Icon(
//             FontAwesomeIcons.instagramSquare,
//             color: Colors.blueGrey[300],
//           ),
//           ),
//         ),
//         GestureDetector(
//           onTap: _launchRD,
//           child: Tooltip(
//             message: 'Reddit',
//             waitDuration: Duration(milliseconds: 500),
//             child: Icon(
//               FontAwesomeIcons.redditSquare,
//               color: Colors.blueGrey[300],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),


