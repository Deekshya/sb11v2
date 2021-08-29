import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/screens/sub_screens/bestxi_screen.dart';
import 'package:sports_buzz11_trial1/screens/sub_screens/preview_screen.dart';

class TargetScreen extends StatelessWidget {
  const TargetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('sportsBuzz11'),
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
          children: [PreviewScreen(), BestXIScreen()],
        ),
      ),
    );
  }
}
