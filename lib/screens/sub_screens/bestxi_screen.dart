import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class BestXIScreen extends StatelessWidget {
  final int cardIndex;

  BestXIScreen({required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: best11ImageUrl[cardIndex].length,
        itemBuilder: (context, index) {
          return Container(
            child: Image(
                image:
                    NetworkImage(best11ImageUrl[cardIndex][index].toString())),
          );
        });
  }
}
