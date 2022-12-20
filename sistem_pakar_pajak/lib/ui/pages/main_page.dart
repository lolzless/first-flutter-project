import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sistem_pakar_pajak/cubit/page_cubit.dart';
import 'package:sistem_pakar_pajak/main.dart';
import 'package:sistem_pakar_pajak/ui/pages/home_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/menu_page.dart';
import 'package:sistem_pakar_pajak/ui/pages/history_page.dart';
import 'package:sistem_pakar_pajak/ui/widgets/custom_bottom_navigation_item.dart';
import '../../shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> initFcm() async {
    await FirebaseMessaging.instance.subscribeToTopic('infoPerpajakan');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFcm();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(
      //   context,
      //   '/message',
      //   arguments: MessageArguments(message, true),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildcontent(int currentindex) {
      switch (currentindex) {
        case 0:
          return HomePage();
        case 1:
          return HistoryPage();
        case 2:
          return MenuPage();
        default:
          return HomePage();
      }
    }

    Widget custombottomnavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // width: double.infinity,
          height: 60,
          decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
            BoxShadow(
              color: kGreyColor.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageurl: 'assets/icon_home.png',
              ),
              // CustomBottomNavigationItem(
              //   imageurl: 'assets/icon_chat.png',
              // ),
              CustomBottomNavigationItem(
                index: 1,
                imageurl: 'assets/icon_history.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageurl: 'assets/icon_menu.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentindex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildcontent(currentindex),
                custombottomnavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
