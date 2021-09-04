import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:sports_buzz11_trial1/screens/target_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      }
      //print(homeTeamNews);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: matchTitle.length,
          itemBuilder: (context, index) {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/India.PNG'),
                                radius: 30,
                              )),
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              Text(
                                matchTitle[index],
                                style: TextStyle(
                                    fontFamily: 'Arvo',
                                    fontSize: 13,
                                    color: Color(0xFF797371),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                                DateTime.now().toString(),
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
                                backgroundImage: AssetImage('images/flag1.PNG'),
                                radius: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
