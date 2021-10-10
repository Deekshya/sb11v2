import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff0d263d);
const kPrimaryColorTran = Color(0xbf0d263d);
const kAccentColor = Colors.white;
const KCardColor = Color(0xff02111d);
const kNewsCardTextColor = Color(0xffebece8);
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

//--------------new section--------------
Map newsData = {};
List<String> newsHeader = ['CSK Qualifies Finals', 'MI may win this Time'];
List<String> newsContent = [
  "Come festive season, brands start offering tons of discounts and cashback to boost their sales. One such brand Xiaomi has now come up with ‘Diwali With Mi' sale to offer serious discounts on its top smartphones such as Redmi Note 10 Pro, Redmi Note 10S,  Mi 11X, Mi 11X Pro, and Xiaomi 11 Lite NE 5G, among otheRs.",
  "The definite article is sometimes also used with proper names, which are already specified by definition (there is just one of them). For example: the Amazon, the Hebrides. In these cases, the definite article may be considered superfluous. Its presence can be accounted for by the assumption that they are shorthand for a longer phrase in which the name is a specifier, i.e. the Amazon River, the Hebridean Islands.[citation needed] Where the nouns in such longer phrases cannot be omitted, the definite article is universally kept: the United States, the People's Republic of China. This distinction can sometimes become a political matter: the former usage the Ukraine stressed the word's Russian meaning of 'borderlands' as Ukraine became a fully independent state following the collapse of the Soviet Union, it requested that formal mentions of its name omit the article. Similar shifts in usage have occurred in the names of Sudan and both Congo (Brazzaville) and Congo (Kinshasa); a move in the other direction occurred with The Gambia. In certain languages, such as French and Italian, definite articles are used with all or most names of countries: la France/le Canada/l'Allemagne, l'Italia/la Spagna/il Brasile."
];
List<String> newsImageUrl = [
  "https://firebasestorage.googleapis.com/v0/b/sportsbuzz11-4f852.appspot.com/o/BannerPlayStore.jpeg?alt=media&token=3b0a0fcd-6980-431e-8b16-b28742557c1a",
  "https://firebasestorage.googleapis.com/v0/b/sportsbuzz11-4f852.appspot.com/o/newsImages%2FBangalore.png?alt=media&token=68a16e51-742a-4cae-a583-b6b319178796"
];
List<String> newsDateTime = ["2nd Oct 2021 19:30", "2nd Oct 2021 19:35"];
List<String> newsSubContent = [
  "CSK has qualified for finals and preparing to win the upcoming match. Check out the latest new by clicking here.",
  "MI seems to have a new strategy to win this time and defeat Mi Team in the Finals.CSK has qualified for finals and preparing to win the upcoming match."
];
