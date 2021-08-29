import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/screens/target_screen.dart';
import 'screens/homeScreen.dart';
import 'package:sports_buzz11_trial1/content/PostContent.dart';
import 'package:sports_buzz11_trial1/content/NewsContent.dart';
import 'package:sports_buzz11_trial1/screens/main_screen_drawer.dart';
import 'screens/trial_bottom_bar_screen.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> bottomNavigationContent = [
    HomeScreen(),
    NewsContent(),
    //TrialBottomBarScreen(),
    PostContent()
    //TargetScreen()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage('images/logo.png'),
              //   fit: BoxFit.cover,
              // )
              // ),
              child: bottomNavigationContent[_currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
                backgroundColor: kPrimaryColor,
              ),
              BottomNavigationBarItem(
                title: Text('News'),
                icon: Icon(Icons.article),
                backgroundColor: kPrimaryColor,
              ),
              BottomNavigationBarItem(
                title: Text('Post'),
                icon: Icon(Icons.feed),
                backgroundColor: kPrimaryColor,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                print(_currentIndex);
              });
            },
          ),
        ),
      ),
    );
  }
}
