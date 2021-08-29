import 'package:flutter/material.dart';

class TrialBottomBarScreen extends StatelessWidget {
  const TrialBottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Image(
          image: AssetImage('images/logo.png'),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
