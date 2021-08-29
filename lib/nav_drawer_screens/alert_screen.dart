import 'package:flutter/material.dart';
class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget aboutUsPopUp(BuildContext context)
  {
    return AlertDialog(
      title: Text('About Us'),
      scrollable: true,
      content: Column(
        children: [
          Container(
            child: Text('Near the beginning of the lockdown in New York City, I thought about all the lonely people who suddenly were having to confront a whole new kind of loneliness. I also thought about all the couples living in all those apartments who were having to redefine their notions of cohabitating. Perhaps most often—and this might sound strange, but it was a pretty strange time—I thought about those cohabitating couples who’d been on the verge of breaking up when the lockdown began, and how any plans to break up had to be shelved (along with all the rest of one’s plans), and what that must have looked like when added to the other stress, worry, and general discontent that comes with a pandemic. Ticking time bombs! I thought. Huge fights! Murders! I could foresee the day Netflix would run dry and was, perhaps, pre-seeding my desire for other people’s drama.Leave it to Alice McDermott to imagine a lockdown scenario of compassion—of love, even—between two people who have already drifted apart yet have chosen to lock down together. Mira and Adam are recent exes living in Brooklyn when the pandemic turns life on its head. While social distancing, by necessity, is driving so')

      ),
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],

      ),
    );
  }

  Widget helpAndSupportPopUp(BuildContext context)
  {
    return AlertDialog(
      title: Text('Help and Support'),
      scrollable: true,
      content: Column(
        children: [
          Container(
              child: Text('Please reach out to us on the mail - sportsBuzz11@gmail.com'),

          ),
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],

      ),
    );
  }

  Widget feedBackPopUp(BuildContext context)
  {
    return AlertDialog(
      title: Text('Give us Feedback'),
      scrollable: true,
      content: Column(
        children: [
          Container(
            child: TextField(keyboardType: TextInputType.multiline,maxLines: null,)

          ),
          FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],

      ),
    );
  }


}
