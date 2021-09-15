import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/screens/target_screen.dart';
import 'screens/homeScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sports_buzz11_trial1/screens/main_screen_drawer.dart';
import 'screens/trial_bottom_bar_screen.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'nav_drawer_screens/alert_screen.dart';

import 'dart:async';

import 'constants.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    remindDays: 0,
    remindLaunches: 4,
  );

  @override
  void initState() {
    super.initState();
    rateMyApp.init().then((_) {
      //if (rateMyApp.shouldOpenDialog) {
      print('in if');
      rateMyApp.showStarRateDialog(context,
          title: 'Enjoying the App?',
          message: 'Please leave a rating..!',
          actionsBuilder: (context, stars) {
            return [
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  if (stars! > 3.0) {
                    rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                    rateMyApp.save().then((value) => Navigator.pop(context));
                  } else if (stars <= 3.0 && stars != 0) {
                    rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
                    showDialog(
                        context: context,
                        builder: (context) =>
                            AlertScreen().feedBackPopUp(context));
                  } else {
                    rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
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
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'targetScreen': (context) => TargetScreen()},
      title: 'SportsBuzz11',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          scaffoldBackgroundColor: kAccentColor),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('SportsBuzz11'),
          ),
          drawer: MainScreenDrawer(),
          body: Container(
            child: HomeScreen(),
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
        image: AssetImage("images/logo.png"),
      ),
    );
  }
}
