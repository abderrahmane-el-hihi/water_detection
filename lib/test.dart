// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:waterdetection/Firebasedb_config/firebase_db.dart';
// import 'package:waterdetection/services/local_notif_service.dart';
// import 'package:flutter_localization/flutter_localization.dart';

// class Test extends StatefulWidget {
//   Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   late Timer timer;
//   late Map<String, dynamic> data = {
//     'email': emailcontroller.text,
//     'password': passcontroller.text,
//     'username': usernamecontroller.text,
//     'id_compt': 4,
//   };

//   var document = {
//     'email': 'John Doe',
//     'password': 'john.doe@example.com',
//   };
//   final emailcontroller = TextEditingController();
//   final passcontroller = TextEditingController();
//   final usernamecontroller = TextEditingController();
//   final idcontroller = TextEditingController();

//   bool isDarkMode = false;
//   final FlutterLocalization localization = FlutterLocalization.instance;

//   GetProfileImage() {
//     if (FirebaseAuth.instance.currentUser?.photoURL == null) {
//       return Image.network(
//         FirebaseAuth.instance.currentUser!.photoURL!,
//         height: 100,
//         width: 100,
//       );
//     } else {
//       return Icon(Icons.account_circle_rounded);
//     }
//   }

//   Map<String, dynamic> d = {'hello': 1};
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Dark Mode Switch'),
//           elevation: 0,
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               FutureBuilder(
//                   future: FirebaseFirestore.instance
//                       .collection('compt')
//                       .doc('compt1')
//                       .get(),
//                   builder: (context, AsyncSnapshot snapshot) {
//                     if (snapshot.hasData) {
//                       String name = snapshot.data!['username'];
//                       return Text('$name');
//                     } else {
//                       return Text('no data');
//                     }
//                   }),
//               ElevatedButton(
//                   onPressed: (() => Firebase_db().Write_Data('water_tank', d)),
//                   child: Text("send data")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> notifications = [
    'This is a notification',
    'This is another notification',
    'This is a third notification',
  ];
  void showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  void _onDayLongPressed(DateTime selectedDay, DateTime focusedDay) {
    // Perform custom logic when a day is long-pressed
    // You can display a dialog, show additional information, etc.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Day'),
          content: Text(selectedDay.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       height: 200,
              //       child: ListView.builder(
              //         itemCount: notifications.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return ListTile(
              //             title: Text(notifications[index]),
              //             trailing: IconButton(
              //               icon: Icon(Icons.delete),
              //               onPressed: () {
              //                 // Delete the notification.
              //                 setState(() {
              //                   notifications.removeAt(index);
              //                 });
              //               },
              //             ),
              //           );
              //         },
              //       ),
              //     );
              //   },
              // );
              // showDate();
              TableCalendar(
                firstDay: DateTime.utc(2022, 1, 1),
                lastDay: DateTime.utc(2022, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDayLongPressed: _onDayLongPressed,
              );
            },
            child: Text('Show Notifications'),
          ),
        ),
      ),
    );
  }
}
