import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';

class ReusablePlayerCards extends StatelessWidget {
  final String homeTeamName;
  final List<dynamic> playersList;

  ReusablePlayerCards({required this.homeTeamName, required this.playersList});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  homeTeamName,
                  textAlign: TextAlign.center,
                  style: kTextStyleInPreviewCardsHeader,
                ),
                SizedBox(
                  height: 5,
                  width: MediaQuery.of(context).size.width - 250,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var player in playersList)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      '$player',
                      style: kTextStyleInPreviewCards,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      elevation: 6,
    );
  }
}
