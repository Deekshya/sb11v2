import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text('NEWS CONTENT SAMPLE'),
        ),
      ),
    );
  }
}
