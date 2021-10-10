import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  void initState() {
    newsData = getData();
    super.initState();
  }

  getData() {
    firestoreInstance.collection("newsCollection").snapshots().listen((result) {
      result.docs.forEach((result) {
        setState(() {
          newsData = result.data();
        });
        print('length:-----${newsData.length}');
        print("newsdata--------->$newsData");
        print(newsData['news3']['header']);
      });
    });
    return newsData;
  }

  @override
  Widget build(BuildContext context) {
    print('in build');

    return Container(
        child: ListView.builder(
            itemCount: newsData.length,
            itemBuilder: (context, index) {
              print('index:$index');
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "newsContentScreen",
                      arguments: index);
                  // Navigator.pushNamed(
                  //   context,
                  //   "webNewsScreen",
                  // );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: KCardColor,
                  margin: EdgeInsets.all(8),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image(
                                image: NetworkImage(
                                    newsData['news' + '${index + 1}']
                                        ['imageUrl']),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "${newsData['news' + '${index + 1}']['header']}",
                                    style: TextStyle(
                                        color: kNewsCardTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "${newsData['news' + '${index + 1}']['subText']}",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
