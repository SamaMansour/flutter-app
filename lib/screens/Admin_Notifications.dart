import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jordantimes_final/screens/Notifications_interface.dart';

class AdminNotifications extends StatefulWidget {
  const AdminNotifications({Key? key}) : super(key: key);

  @override
  _AdminNotificationsState createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  String payload = " ";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
    flutterLocalNotificationsPlugin.initialize(initSetttings
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future onSelectNotification(String payload) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NotificationsInterface(
        payload: payload,
      );
    }));
  }
}
