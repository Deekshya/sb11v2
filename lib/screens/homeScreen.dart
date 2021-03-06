import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  int flag = 0;
  int temp = 0;
  var keys;
  var values;
  Timer? timer;

  late StreamSubscription<DataConnectionStatus> listener;
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  _showDialogForInternet() async {
    await Future.delayed(Duration(milliseconds: 50));
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(" No Internet Connection"),
              content: Text("Please check your internet connection."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternetConnection();
                    },
                    child: Text('Retry'))
              ],
            ));
  }

  @override
  void dispose() {
    listener.cancel();
    timer?.cancel();
    super.dispose();
  }

  checkInternetConnection() async {
    // Simple check to see if we have internet
    //print("The statement 'this machine is connected to the Internet' is: ");
    //print(await DataConnectionChecker().hasConnection);
    bool stat = await DataConnectionChecker().hasConnection;
    //print("bool value -------$stat");

    if (await DataConnectionChecker().hasConnection == true) {
      //print("yes net-------");
      getDate();
      //print("get data is read");
    } else {
      //print("------no internet");
      _showDialogForInternet();
    }
    // returns a bool

    // We can also get an enum value instead of a bool
    // print("Current status: ${await DataConnectionChecker().connectionStatus}");
    // String stat = "${await DataConnectionChecker().connectionStatus}";
    // print("<<<<<<<<<$stat");
    // prints either DataConnectionStatus.connected
    // or DataConnectionStatus.disconnected

    // This returns the last results from the last call
    // to either hasConnection or connectionStatus
    //print("Last results: ${DataConnectionChecker().lastTryResults}");

    // actively listen for status updates
    // this will cause DataConnectionChecker to check periodically
    // with the interval specified in DataConnectionChecker().checkInterval
    // until listener.cancel() is called
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
  }

  void getDate() {
    databaseReference.child("").onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      keys = dataSnapshot.value.keys;
      values = dataSnapshot.value;
      clearList();
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
          homeTeamNews.add(values[key]["cardData"]["homeTeamNews"]);
          awayTeamNews.add(values[key]["cardData"]["awayTeamNews"]);

          awayTeamFlagUrl.add(values[key]["awayTeamFlagUrl"]);
          homeTeamFlagUrl.add(values[key]["homeTeamFlagUrl"]);

          startTimeOfMatch.add(values[key]["startTimeOfMatch"]);
          endTimeOfMatch.add(values[key]["endTimeOfMatch"]);

          best11ImageUrl.add(values[key]["best11"]);
          DateTime sDateTime = DateTime.parse(values[key]["startTimeOfMatch"]);
          DateTime eDateTime = DateTime.parse(values[key]["endTimeOfMatch"]);
          flag = checkStatus(sDateTime, eDateTime);
          flagsStatus.add(flag);
          databaseReference.child("$key").update({"matchStatus": flag});

          keyList.add(key);
        });
      }
    });
  }

  int checkStatus(DateTime sDateTime, DateTime eDateTime) {
    int temp;
    if (DateTime.now().isAfter(sDateTime) && DateTime.now().isBefore(eDateTime))
      temp = 1; //match is live
    else if (DateTime.now().isAfter(eDateTime))
      temp = 2; //match is completed
    else
      temp = 3; //match is upcoming
    return temp;
  }

  void checkStatusTimer(
      int index, var path, DateTime sDateTime, DateTime eDateTime) {
    if (DateTime.now().isAfter(sDateTime) &&
        DateTime.now().isBefore(eDateTime)) {
      flagsStatus[index] = 1; //match is live
      databaseReference
          .child("$path")
          .update({"matchStatus": flagsStatus[index]});
    } else if (DateTime.now().isAfter(eDateTime)) {
      flagsStatus[index] = 2; //match is completed
      databaseReference
          .child("$path")
          .update({"matchStatus": flagsStatus[index]});
    } else {
      flagsStatus[index] = 3; //match is upcoming
      databaseReference
          .child("$path")
          .update({"matchStatus": flagsStatus[index]});
    }
  }

  @override
  Widget build(BuildContext context) {
    flag = temp;
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: matchTitle.length,
            itemBuilder: (context, index) {
              DateTime sDateTime = DateTime.parse(startTimeOfMatch[index]);
              DateTime eDateTime = DateTime.parse(endTimeOfMatch[index]);

              //flag = checkStatus(index, sDateTime, eDateTime);
              timer = Timer.periodic(
                  Duration(seconds: 5),
                  (Timer t) => checkStatusTimer(
                      index, keyList[index], sDateTime, eDateTime));
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
                                  padding: const EdgeInsets.only(left: 10),
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
                                    child: status[flagsStatus[index]])
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 2,
                              width: double.infinity,
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
                                          NetworkImage(homeTeamFlagUrl[index]),
                                      radius: 30,
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Column(children: [
                                    Hero(
                                      tag: matchCenterTitle[index],
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Text(
                                          matchCenterTitle[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              letterSpacing: 5,
                                              fontFamily: 'Arvo',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
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
                                          NetworkImage(awayTeamFlagUrl[index]),
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
