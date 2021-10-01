import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sports_buzz11_trial1/constants.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String data = '';

  fetchDataFromFile() async {
    String fetchedData =
        await rootBundle.loadString('textFiles/privacyPolicy.txt');

    setState(() {
      data = fetchedData;
      print('data:$data');
    });
  }

  @override
  void initState() {
    print('init');
    fetchDataFromFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Privacy Policy'),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Text(
              data,
              style: TextStyle(
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
