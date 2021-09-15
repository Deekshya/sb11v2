import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:sports_buzz11_trial1/components/reusable_weather_pitch_card.dart';
import 'package:sports_buzz11_trial1/components/reusable_player_cards.dart';
import 'package:sports_buzz11_trial1/components/reusable_news_card.dart';

class PreviewScreen extends StatelessWidget {
  final int index;
  PreviewScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Weather Report:',
                    textAlign: TextAlign.center, style: kSubHeading),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: WeatherAndPitchCard(
                    label1: 'Temperature: ${weather[index]['temperature']}℃',
                    label2: 'Humidity: ${weather[index]['humidity']}%',
                    label3: '${weather[index]['climateEmoji']}',
                    size: 35,
                  )),
              Text('Pitch Report:',
                  textAlign: TextAlign.center, style: kSubHeading),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: WeatherAndPitchCard(
                    label1: '${pitch[index]['stadiumName']}',
                    label2: '${pitch[index]['batOrBall']}',
                    label3: 'Avg. Score: ${pitch[index]['avgScore']}',
                    size: 18,
                  )),
              Text('Playing 11:',
                  textAlign: TextAlign.center, style: kSubHeading),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: ReusablePlayerCards(
                      homeTeamName: homeTeam[index],
                      playersList: homePlaying11[index],
                    )),
                    Expanded(
                        child: ReusablePlayerCards(
                      homeTeamName: awayTeam[index],
                      playersList: awayPlaying11[index],
                    ))
                  ],
                ),
              ),
              Text('Key Players:',
                  textAlign: TextAlign.center, style: kSubHeading),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: ReusablePlayerCards(
                      homeTeamName: homeTeam[index],
                      playersList: homeKeyPlayers[index],
                    )),
                    Expanded(
                        child: ReusablePlayerCards(
                      homeTeamName: awayTeam[index],
                      playersList: awayKeyPlayers[index],
                    )),
                  ],
                ),
              ),
              Text('${homeTeam[index]} News:',
                  textAlign: TextAlign.center, style: kSubHeading),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ReusableNewsCard(
                    newsList: homeTeamNews[index],
                  )),
              Text('${awayTeam[index]} News:',
                  textAlign: TextAlign.center, style: kSubHeading),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ReusableNewsCard(
                  newsList: awayTeamNews[index],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
