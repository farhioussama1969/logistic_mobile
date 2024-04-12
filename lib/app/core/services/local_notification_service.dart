import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class LocalNotificationService {
  static final localNotification = FlutterLocalNotificationsPlugin();

  static void initialize() {
    localNotification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('notification_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
    );
  }

  static void showNotification({required String? title, required String? body}) {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'taxili_channel',
      'taxili_channel',
      channelDescription: 'Taxili channel',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('taxi_horn_audio'),
      enableVibration: true,
      color: MainColors.primaryColor,
    );
    DarwinNotificationDetails iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    localNotification.show(1, title, body, platformChannelSpecifics);
  }
}
