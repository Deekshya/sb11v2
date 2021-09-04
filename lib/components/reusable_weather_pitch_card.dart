import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class WeatherAndPitchCard extends StatelessWidget {
  final String label1;
  final String label2;
  final String label3;
  final double size;

  WeatherAndPitchCard({
    required this.label1,
    required this.label2,
    required this.label3,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColorTran,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label1, style: kInCardTextStyle),
                Text(
                  label2,
                  style: kInCardTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1,
            child: Divider(
              thickness: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            label3,
            style: TextStyle(fontSize: size),
          ),
        ],
      ),
    );
  }
}
