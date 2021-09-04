import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class ReusableNewsCard extends StatelessWidget {
  final List<dynamic> newsList;
  ReusableNewsCard({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColorTran,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var news in newsList)
              Text(
                ' • $news',
                style: kTextStyleInPreviewCards,
              ),
          ],
        ),
      ),
      elevation: 6,
    );
  }
}
