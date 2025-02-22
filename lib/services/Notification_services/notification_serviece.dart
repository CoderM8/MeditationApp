//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// int id = 0;
// class NotificationService {
//   static final NotificationService _notificationService =
//   NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   NotificationService._internal();
//
//   Future<void> initNotification() async {
//
//     // Android initialization
//     final AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     // ios initialization
//     final DarwinInitializationSettings initializationSettingsIOS =
//     DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS);
//     // the initialization settings are initialized after they are setted
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> showNotification(int id, String title, String body) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.now(tz.local).add(Duration(
//           seconds: 1)), //schedule the notification to show after 2 seconds.
//       const NotificationDetails(
//
//         // Android details
//         android: AndroidNotificationDetails('main_channel', 'Main Channel',
//             channelDescription: "ashwin",
//             importance: Importance.max,
//             priority: Priority.max),
//         // iOS details
//         iOS: DarwinNotificationDetails(
//           sound: 'default.wav',
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         ),
//       ),
//
//       // Type of time interpretation
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime, // To show notification even when the app is closed
//     );
//   }
//   Future<void> repeatNotification() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//         'repeating channel id', 'repeating channel name',
//         channelDescription: 'repeating description');
//     const NotificationDetails notificationDetails =
//     NotificationDetails(android: androidNotificationDetails);
//     await flutterLocalNotificationsPlugin.periodicallyShow(
//       id++,
//       'repeating title',
//       'repeating body',
//       RepeatInterval.daily,
//       notificationDetails,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//     );
//   }
//
// }
