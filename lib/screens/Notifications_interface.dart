import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsInterface extends StatelessWidget {
   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

 String payload;
NotificationsInterface({
required this.payload,
});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(payload),
),);}
showNotification() async {
var android = new AndroidNotificationDetails(
'id', 'channel ',
priority: Priority.high, importance: Importance.max);
var iOS = new IOSNotificationDetails();
var platform = new NotificationDetails(android: android, iOS: iOS);
await flutterLocalNotificationsPlugin.show(
0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
payload: 'Welcome to the Local Notification demo ');
}



Future<void> scheduleNotification() async {
var scheduledNotificationDateTime =
DateTime.now().add(Duration(seconds: 4));
var androidPlatformChannelSpecifics = AndroidNotificationDetails(
'channel id',
'channel name',

icon: 'flutter_devs',
largeIcon: DrawableResourceAndroidBitmap('flutter_devs'),
);
var iOSPlatformChannelSpecifics = IOSNotificationDetails();
var platformChannelSpecifics = NotificationDetails(
android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.schedule(
0,
'scheduled title',
'scheduled body',
scheduledNotificationDateTime,
platformChannelSpecifics);
}
  Future<void> showBigPictureNotification() async {
var bigPictureStyleInformation = BigPictureStyleInformation(
DrawableResourceAndroidBitmap("flutter_devs"),
largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
contentTitle: 'flutter devs',
htmlFormatContentTitle: true,
summaryText: 'summaryText',
htmlFormatSummaryText: true);
var androidPlatformChannelSpecifics = AndroidNotificationDetails(
'big text channel id',
'big text channel name',

styleInformation: bigPictureStyleInformation);
var platformChannelSpecifics =
NotificationDetails(android: androidPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.show(
0, 'big text title', 'silent body', platformChannelSpecifics,
payload: "big image notifications");
}


Future<void> showNotificationMediaStyle() async {
var androidPlatformChannelSpecifics = AndroidNotificationDetails(
'media channel id',
'media channel name',

color: Colors.blue,
enableLights: true,
largeIcon: DrawableResourceAndroidBitmap("flutter_devs"),
styleInformation: MediaStyleInformation(),
);
var platformChannelSpecifics =
NotificationDetails(android: androidPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.show(
0, 'notification title', 'notification body', platformChannelSpecifics,payload: "show Notification Media Style");
}


Future<void> cancelNotification() async {
await flutterLocalNotificationsPlugin.cancel(0);
}
}