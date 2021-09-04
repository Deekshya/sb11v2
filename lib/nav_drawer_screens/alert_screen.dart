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
                  'Near the beginning of the lockdown in New York City, I thought about all the lonely people who suddenly were having to confront a whole new kind of loneliness. I also thought about all the couples living in all those apartments who were having to redefine their notions of cohabitating. Perhaps most often—and this might sound strange, but it was a pretty strange time—I thought about those cohabitating couples who’d been on the verge of breaking up when the lockdown began, and how any plans to break up had to be shelved (along with all the rest of one’s plans), and what that must have looked like when added to the other stress, worry, and general discontent that comes with a pandemic. Ticking time bombs! I thought. Huge fights! Murders! I could foresee the day Netflix would run dry and was, perhaps, pre-seeding my desire for other people’s drama.Leave it to Alice McDermott to imagine a lockdown scenario of compassion—of love, even—between two people who have already drifted apart yet have chosen to lock down together. Mira and Adam are recent exes living in Brooklyn when the pandemic turns life on its head. While social distancing, by necessity, is driving so')),
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
                'Please reach out to us on the mail - sportsBuzz11@gmail.com'),
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
