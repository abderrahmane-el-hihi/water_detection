import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notif {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationsSettings = new InitializationSettings(
      android: androidInitialize,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
    );
  }

  static Future showBigTextNotification(
      {var id = 2,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      '',
      '',
      playSound: true,
      //sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );
    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.show(0, title, body, not);
  }

  // static Future showBackgroundNotification(
  //     {var id = 1,
  //     required String title,
  //     required String body,
  //     var payload,
  //     required FlutterLocalNotificationsPlugin fln}) async {
  //   await fln.periodicallyShow(
  //     id,
  //     title,
  //     body,
  //     RepeatInterval.everyMinute,
  //     NotificationDetails(
  //       android: new AndroidNotificationDetails(
  //         '',
  //         '',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //     ),
  //   );
  // }
}
