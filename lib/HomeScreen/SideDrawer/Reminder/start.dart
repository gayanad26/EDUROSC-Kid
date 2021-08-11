import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Reminder/store/AppState.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Reminder/store/store.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Reminder/utils/notificationHelper.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'builder/NotificationSwitchBuilder.dart';
import 'builder/ReminderAlertBuilder.dart';
import 'builder/RemindersListViewBuilder.dart';
import 'models/index.dart';

final df = new DateFormat('dd-MM-yyyy hh:mm a');

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;
Store<AppState> store;



class LaunchingApp extends StatelessWidget {
    

  final Store<AppState> store;
  LaunchingApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      child: MaterialApp(
          title: 'REMINDERS',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Reminders App'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Reminders list",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: SizedBox(
                            child: StoreConnector<AppState, List<Reminder>>(
                                converter: (store) =>
                                    store.state.remindersState.reminders,
                                builder: (context, reminders) {
                                  return RemindersList(reminders: reminders);
                                }),
                            height: Platform.isAndroid ? 380 : 500,
                          ))),
                  
                  //Set reminder button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: ReminderAlertBuilder()),
                      //Cancel all button
                      // Padding(
                      //     padding: EdgeInsets.all(10),
                      //     child: NotificationSwitchBuilder()),
                    ],
                  ),
                ],
              ),
            ),
          )),
      store: store,
    );

    ;
  }
}