import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNewsView extends StatelessWidget {
  const WebNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://firebasestorage.googleapis.com/v0/b/sportsbuzz11-4f852.appspot.com/o/demo.html?alt=media&token=b1f1d7d7-dc2c-49e2-8563-0e6323a4c686',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
