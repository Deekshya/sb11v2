import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff0d263d);
const kPrimaryColorTran = Color(0xbf0d263d);
const kAccentColor = Colors.white;
const KCardColor = Color(0xff02111d);
//Color(0xff02111d);
const kSubHeading =
    TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
const kInCardTextStyle = TextStyle(fontSize: 16, color: Color(0xffebece8));
void getData() {}
const kStyleInFeedback =
    TextStyle(color: Color(0xFF474545), fontWeight: FontWeight.bold);

const kTeamNews = 'asfsdfasfasdfasdfa \n' 'asfsdfasfasdfasdfa \n';

const kTextStyleInPreviewCards =
    TextStyle(color: Color(0xffebece8), fontSize: 14);
const kTextStyleInPreviewCardsHeader = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 2);
//card on homeScreen
List<String> matchTitle = [];
List<String> matchCenterTitle = [];

List<String> startTimeOfMatch = [];
List<String> endTimeOfMatch = [];

List<String> awayTeamFlagUrl = [];
List<String> homeTeamFlagUrl = [];
//content of preview screen
List<Map> weather = [];
List<Map> pitch = [];
List<List> awayPlaying11 = [];
List<List> homePlaying11 = [];

List<String> homeTeam = [];
List<String> awayTeam = [];

List<List> awayKeyPlayers = [];
List<List> homeKeyPlayers = [];

List<List> homeTeamNews = [];
List<List> awayTeamNews = [];

List<String> keyList = [];

List<List> best11ImageUrl = [];
List<int> flagsStatus = [];
void clearList() {
  keyList.clear();
  flagsStatus.clear();
  matchTitle.clear();
  matchCenterTitle.clear();

  startTimeOfMatch.clear();
  endTimeOfMatch.clear();

  awayTeamFlagUrl.clear();
  homeTeamFlagUrl.clear();
//content of preview screen
  weather.clear();
  pitch.clear();
  awayPlaying11.clear();
  homePlaying11.clear();

  homeTeam.clear();
  awayTeam.clear();

  awayKeyPlayers.clear();
  homeKeyPlayers.clear();
  homeTeamNews.clear();
  awayTeamNews.clear();
}

Map<int, Widget> status = {
  1: Container(
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        '• LIVE',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ),
  ),
  2: Container(
    decoration: BoxDecoration(
        color: Colors.amber[900], borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        'COMPLETED',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ),
  ),
  3: Container(
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        'UPCOMING',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ),
  ),
};
