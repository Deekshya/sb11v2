import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sports_buzz11_trial1/screens/web_news_view.dart';

class NewsContentScreen extends StatefulWidget {
  @override
  State<NewsContentScreen> createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {
  late firebase_storage.Reference firebaseStorage;

  @override
  void initState() {
    firebaseStorage = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('/privacyPolicy.txt');

    getNewsData();
    super.initState();
  }

  getNewsData() async {
    var data = await firebaseStorage.getData();
    print(utf8.decode(data!));
  }

  @override
  Widget build(BuildContext context) {
    int index =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
              image: NetworkImage(newsImageUrl[index]),
              fit: BoxFit.cover,
            ),
          ),
          pinned: true,
          expandedHeight: 300,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical,
                child: WebView(
                  initialUrl:
                      'https://firebasestorage.googleapis.com/v0/b/sportsbuzz11-4f852.appspot.com/o/demo.html?alt=media&token=1fb1e815-637d-4b25-a709-6e32099d6795',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ),
          )
        ]))
      ],
    ));
  }
}
