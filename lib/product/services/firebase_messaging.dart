import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/web.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();

  Logger().i("Handling a background message: ${message.notification!.title}");
}

void _firebaseMessagingForegroundHandler(RemoteMessage message) {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();

  Logger().i("Handling a background message: ${message.notification!.title}");
  Logger().i("Handling a background message: ${message.notification!.body}");
}

final class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static void _requestPermissionNotification() async {
    await _messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  static void connectNotification() {
    _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    _requestPermissionNotification();

    // notification while application open in screen
    FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

    // notification while application closed or inbackground
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
