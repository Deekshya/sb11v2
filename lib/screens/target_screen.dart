import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/screens/sub_screens/bestxi_screen.dart';
import 'package:sports_buzz11_trial1/screens/sub_screens/preview_screen.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class TargetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Hero(
            tag: matchCenterTitle[index],
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                '${matchCenterTitle[index]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 5,
                    fontFamily: 'Arvo',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Preview',
              ),
              Tab(
                text: 'BestXI',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PreviewScreen(index: index),
            BestXIScreen(
              cardIndex: index,
            )
          ],
        ),
      ),
    );
  }
}
