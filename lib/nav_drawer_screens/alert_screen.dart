import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share/share.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget aboutUsPopUp(BuildContext context) {
    return AlertDialog(
      title: Text('About Us'),
      scrollable: true,
      content: Column(
        children: [
          Container(
              child: Text(
                  'SportsBuzz11 provides match predictions for all fantasy premier league and fantasy games. This application provides predictions for soccer games, all International and Domestic Cricket matches, Kabaddi League and NBA matches. It also provides sports news, the Full fixture of International Series and today match prediction. SportsBuzz11 provide pre-match report and dream team for famous fantasy leagues like IPL, BBL, CPL, KPL and soccer fantasy like LaLiga (Spain fantasy football league), European Cup and International Football Matches.'
                  'We have set our vision to provide the best of the predictions and information related to the way someone will be playing Fantasy sports.')),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'))
        ],
      ),
    );
  }

  Widget helpAndSupportPopUp(BuildContext context) {
    return AlertDialog(
      title: Text('Help and Support'),
      scrollable: true,
      content: Column(
        children: [
          Container(
            child: Text(
                'Please reach out to us on the mail - buzzsports11@gmail.com'),
          ),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'))
        ],
      ),
    );
  }

  Future sendEmail(
      {required String user_name,
      required String user_subject,
      required String user_email,
      required String user_message}) async {
    final serviceId = 'service_cawhr8r';
    final templateId = 'template_syb4lgb';
    final userid = 'user_PeUTe2kghK4CC5SY6FIZ4';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userid,
          'template_params': {
            'user_name': user_name,
            'user_subject': user_subject,
            'user_email': user_email,
            'user_message': user_message
          }
        }),
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        });
    print(response.body);
  }

  Widget feedBackPopUp(BuildContext context) {
    late String name;
    late String email;
    late String subject;
    late String message;
    return AlertDialog(
      title: Text('Give us Feedback'),
      scrollable: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name:',
            style: kStyleInFeedback,
          ),
          Container(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              name = value;
            },
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            'EmailID:',
            style: kStyleInFeedback,
          ),
          Container(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              email = value;
            },
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            'Subject:',
            style: kStyleInFeedback,
          ),
          Container(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              subject = value;
            },
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            'Description:',
            style: kStyleInFeedback,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Color(0xffc1d6f6),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              onChanged: (value) {
                message = value;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              sendEmail(
                  user_name: name,
                  user_subject: subject,
                  user_email: email,
                  user_message: message);
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Send Feedback!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget shareThisApp() {
    return Text('hi');
  }
}
