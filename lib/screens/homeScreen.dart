import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:sports_buzz11_trial1/components/reusable_status_card.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int flag = 0;
  var keys;
  @override
  void initState() {
    super.initState();

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        setState(() {
          matchTitle.add(values[key]["matchTitle"]);
          matchCenterTitle.add(values[key]["matchCenterTitle"]);
          awayPlaying11
              .add(values[key]["cardData"]["playing11"]["awayPlaying11"]);
          homePlaying11
              .add(values[key]["cardData"]["playing11"]["homePlaying11"]);
          weather.add(values[key]['cardData']['weather']);
          pitch.add(values[key]['cardData']['pitch']);
          homeTeam.add(values[key]['homeTeam']);
          awayTeam.add(values[key]['awayTeam']);
          awayKeyPlayers
              .add(values[key]["cardData"]["keyPlayers"]["awayKeyPlayers"]);
          homeKeyPlayers
              .add(values[key]["cardData"]["keyPlayers"]["homeKeyPlayers"]);
        });
        homeTeamNews.add(values[key]["cardData"]["homeTeamNews"]);
        awayTeamNews.add(values[key]["cardData"]["awayTeamNews"]);

        awayTeamFlagUrl.add(values[key]["awayTeamFlagUrl"]);
        homeTeamFlagUrl.add(values[key]["homeTeamFlagUrl"]);

        startTimeOfMatch.add(values[key]["startTimeOfMatch"]);
        endTimeOfMatch.add(values[key]["endTimeOfMatch"]);
      }

      //print(sDateTime);
    });
  }

  int checkStatus(DateTime sDateTime, DateTime eDateTime) {
    if (DateTime.now().isAfter(sDateTime) && DateTime.now().isBefore(eDateTime))
      flag = 1; //match is live
    else if (DateTime.now().isAfter(eDateTime))
      flag = 2; //match is completed
    else
      flag = 3; //match is upcoming
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.refresh,
            color: kAccentColor,
            size: 30,
          ),
          onPressed: () {
            Phoenix.rebirth(context);
          }),
      body: Container(
        child: ListView.builder(
            itemCount: matchTitle.length,
            itemBuilder: (context, index) {
              DateTime sDateTime = DateTime.parse(startTimeOfMatch[index]);
              DateTime eDateTime = DateTime.parse(endTimeOfMatch[index]);
              flag = checkStatus(sDateTime, eDateTime);
              //print(DateFormat('y/M/d H:m').format(sDateTime));

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "targetScreen",
                        arguments: index);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: KCardColor,
                    elevation: 20,
                    shadowColor: Colors.black.withRed(100),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: Text(
                                    matchTitle[index],
                                    style: TextStyle(
                                        fontFamily: 'Arvo',
                                        fontSize: 13,
                                        color: Color(0xFF797371),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: status[flag])
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 2,
                              width: MediaQuery.of(context).size.width - 200,
                              child: Divider(
                                thickness: .5,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(awayTeamFlagUrl[index]),
                                      radius: 30,
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Column(children: [
                                    Text(
                                      matchCenterTitle[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          letterSpacing: 5,
                                          fontFamily: 'Arvo',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '${DateFormat('y/M/d  H:m').format(sDateTime)}',
                                      style: TextStyle(
                                          fontFamily: 'Arvo',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF797371)),
                                    )
                                  ]),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(homeTeamFlagUrl[index]),
                                      radius: 30,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
