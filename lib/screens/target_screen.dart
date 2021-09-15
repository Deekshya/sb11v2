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
          title: Hero(
            tag: "matchTitleHero",
            child: Text(
              '${matchCenterTitle[index]}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
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
