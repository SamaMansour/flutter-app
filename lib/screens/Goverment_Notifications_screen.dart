import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GovermentNotifications extends StatefulWidget {
  @override
  _GovermentNotificationsState createState() => _GovermentNotificationsState();
}

class _GovermentNotificationsState extends State<GovermentNotifications> {
  
  @override

  

  void initState() {
    super.initState();
    
  var android = AndroidInitializationSettings('mipmap-hdpi/ic_launcher.png');
    var ios = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: ios);
    var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

 



  showNotification() async {
    var android = AndroidNotificationDetails(
        'channel id',
        'channel NAME',
        
        importance: Importance.high,
      
        ticker: 'ticker'
    );
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    var flutterLocalNotificationsPlugin;
    await flutterLocalNotificationsPlugin.show(0, "New Notification", "I'm notification", 
    platform, payload: "It works");
  }


 

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    showNotification();
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'notify',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
