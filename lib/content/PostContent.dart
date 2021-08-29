import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text('POST CONTENT SAMPLE'),
        ),
      ),
    );
  }
}
