import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class BestXIScreen extends StatelessWidget {
  final int cardIndex;

  BestXIScreen({required this.cardIndex});

  List<String> best11Title = ['Grand League', 'Small League', 'Head to Head'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: best11ImageUrl[cardIndex].length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Team ' + '${index + 1}: ${best11Title[index]}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      'Coming Soon...',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                          image: NetworkImage(
                        best11ImageUrl[cardIndex][index].toString(),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
