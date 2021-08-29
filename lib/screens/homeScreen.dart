import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:sports_buzz11_trial1/screens/target_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "targetScreen");
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
                                  backgroundImage:
                                      AssetImage('images/India.PNG'),
                                  radius: 30,
                                )),
                            Expanded(
                              flex: 3,
                              child: Column(children: [
                                Text(
                                  heading[index],
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
                                  title[index],
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
                                  backgroundImage:
                                      AssetImage('images/flag1.PNG'),
                                  radius: 30,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

List<String> title = [
  'IND vs AUS',
  'IND vs NED', //max 22
  'PAK vs IND',
  'SOU vs WES',
  'ENG vs IND'
];

List<String> heading = [
  'India vs Australia T20',
  'India vs Netherlands T20',
  'Pakistan vs India T20',
  'South Africa vs WestIndies T20',
  'England vs India T20'
];
