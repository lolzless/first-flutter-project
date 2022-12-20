import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sistem_pakar_pajak/cubit/auth_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/category_bu_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/category_op_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/page_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/solusi_bu_cubit.dart';
import 'package:sistem_pakar_pajak/cubit/solusi_op_cubit.dart';
import 'package:sistem_pakar_pajak/services/category_op_services.dart';
import 'package:sistem_pakar_pajak/shared/theme.dart';
import 'package:sistem_pakar_pajak/ui/pages/category_masalah_bu_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/category_masalah_op_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/daftar_klien.dart';
import 'package:sistem_pakar_pajak/ui/pages/get_started_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/chat_pakar_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/login_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/main_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/question_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/reset_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/sign_up_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar_pajak/shared/utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryBuCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryOpCubit(),
        ),
        BlocProvider(
          create: (context) => SolusiOpCubit(),
        ),
        BlocProvider(
          create: (context) => SolusiBuCubit(),
        )
      ],
      child: MaterialApp(
        navigatorKey: utils.mainAppNav,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/login': (context) => LoginPage(),
          '/main': (context) => MainPage(),
          '/categoryop': (context) => CategoryOp(),
          '/categorybadan': (context) => CategoryBadan(),
          '/chatpakar': (context) => ChatPakar(),
          '/daftarklien': (context) => EmailSender(),
          '/reset': (context) => ResetPage(),
        },
      ),
    );
  }
}
