import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';

class NewsContentScreen extends StatefulWidget {
  @override
  State<NewsContentScreen> createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {
  @override
  Widget build(BuildContext context) {
    int cardIndex =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());
    print('${newsData['news' + '${cardIndex + 1}']['content'][0]}');
    return Scaffold(
        backgroundColor: KCardColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              // title: Text(
              //   'NEWS',
              //   style: TextStyle(fontSize: 15),
              // ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage(
                      newsData['news' + '${cardIndex + 1}']['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              expandedHeight: 300,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Container(
                  color: KCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      //MediaQuery.of(context).padding.vertical,
                      children: [
                        Text(
                          '${newsData['news' + '${cardIndex + 1}']['header']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Arvo',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${newsData['news' + '${cardIndex + 1}']['date']} - SportsBuzz11',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                          ),
                        ),
                        //ListView Didnt work here so we added a new SliverList
                        // ListView.builder(
                        //     itemCount: newsData['news' + '${cardIndex + 1}']
                        //             ['content']
                        //         .length,
                        //     itemBuilder: (context, index) {
                        //       return Container(
                        //         child: Text(
                        //             '${newsData['news' + '${cardIndex + 1}']['content'][index]}'),
                        //       );
                        //     })
                      ],
                    ),
                  ),
                ),
              )
            ])),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: KCardColor,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Text(
                            '      ${newsData['news' + '${cardIndex + 1}']['content'][index]}',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount:
                    newsData['news' + '${cardIndex + 1}']['content'].length,
              ),
            ),
          ],
        ));
  }
}
