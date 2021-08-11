import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:e_companion/HomeScreen/SideDrawer/Reminder/start.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStore();
  store = getStore();
  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(LaunchingApp(store));
}