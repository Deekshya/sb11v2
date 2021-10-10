import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/screens/privacy_policy_screen.dart';
import 'package:sports_buzz11_trial1/screens/target_screen.dart';
import 'screens/homeScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sports_buzz11_trial1/screens/main_screen_drawer.dart';
import 'screens/trial_bottom_bar_screen.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'nav_drawer_screens/alert_screen.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sports_buzz11_trial1/screens/news_screen.dart';
import 'package:sports_buzz11_trial1/screens/news_content_screen.dart';
import 'dart:async';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen(_firebasePushHandler);
  FirebaseMessaging.onBackgroundMessage(_firebasePushHandler);
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'key1',
      channelName: 'sportsbuzz11 point',
      channelDescription: 'Motification Example',
      defaultColor: Color(0xff9858DD),
      ledColor: Colors.white,
      playSound: true,
      enableLights: true,
      enableVibration: true,
    )
  ]);
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  List bottomNavigationContent = [HomeScreen(), NewsScreen()];

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 9,
    remindDays: 7,
    remindLaunches: 10,
  );

  @override
  void initState() {
    super.initState();
    rateMyApp.init().then((_) {
      if (rateMyApp.shouldOpenDialog) {
        print('in if');
        rateMyApp.showStarRateDialog(context,
            title: 'Enjoying the App?',
            message: 'Please leave a rating..!',
            actionsBuilder: (context, stars) {
              return [
                FlatButton(
                  child: Text('SUBMIT'),
                  onPressed: () {
                    if (stars! > 3.0) {
                      StoreRedirect.redirect(androidAppId: 'com.sports.buzz11');
                      rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                      rateMyApp.save().then((value) => Navigator.pop(context));
                    } else if (stars <= 3.0 && stars != 0) {
                      rateMyApp
                          .callEvent(RateMyAppEventType.laterButtonPressed);
                      showDialog(
                          context: context,
                          builder: (context) =>
                              AlertScreen().feedBackPopUp(context));
                    } else {
                      rateMyApp
                          .callEvent(RateMyAppEventType.laterButtonPressed);
                      Navigator.pop(context);
                    }
                  },
                )
              ];
            },
            dialogStyle: DialogStyle(
              titleAlign: TextAlign.center,
              messageAlign: TextAlign.center,
              messagePadding: EdgeInsets.only(bottom: 20),
            ),
            starRatingOptions: StarRatingOptions(),
            onDismissed: () =>
                rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'targetScreen': (context) => TargetScreen(),
        'privacyPolicyScreen': (context) => PrivacyPolicyScreen(),
        'newsContentScreen': (context) => NewsContentScreen(),
      },
      title: 'SportsBuzz11',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          scaffoldBackgroundColor: kAccentColor),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  backgroundColor: kPrimaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.article), title: Text('News')),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('SportsBuzz11'),
          ),
          drawer: MainScreenDrawer(),
          body: Container(
            child: bottomNavigationContent[_currentIndex],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0d263d),
      child: Image(
        image: AssetImage("images/bannerLogo.png"),
      ),
    );
  }
}

Future<void> _firebasePushHandler(RemoteMessage message) async {
  print("Message from push notification is ${message.data}");
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}
