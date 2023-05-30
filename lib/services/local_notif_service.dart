import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   void ScheduleNotif() async {
//     DateTime dateTime = DateTime.now().add(Duration(seconds: 10));
//     tz.TZDateTime scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

//     //DateTime dateTime = DateTime.now();
//     //tz.TZDateTime scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

//     const int id = 0; // Unique ID for the notification
//     const String title = 'My Notification'; // Notification title
//     const String body =
//         'This is a notification from my app.'; // Notification body
//     const String payload =
//         'payload'; // Payload data to send with the notification

//     // Set the time for the notification to be shown (in this case, 10 seconds from now)
//     //final DateTime now = DateTime.now();
//     //late DateTime scheduledDate = now.add(const Duration(seconds: 10));

//     // Define the notification details
//     final AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//       styleInformation: BigTextStyleInformation(''),
//     );

//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     // Schedule the notification
//     flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledDate,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       payload: payload,
//     );
//   }
// }

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
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
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
}
