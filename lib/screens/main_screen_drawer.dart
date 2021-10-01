import 'package:flutter/material.dart';
import 'package:sports_buzz11_trial1/components/ReusableDrawerTabs.dart';
import 'package:sports_buzz11_trial1/nav_drawer_screens/alert_screen.dart';
import 'package:share/share.dart';

class MainScreenDrawer extends StatelessWidget {
  const MainScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffd9e8f6),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  color: Color(0xff0d263d),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        foregroundImage: AssetImage('images/banner.jpeg'),
                        radius: 50,
                        backgroundImage: AssetImage('images/banner.jpeg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'SportsBuzz11',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Column(
                    children: [
                      ReusableDrawerTabs(
                        label: 'About Us',
                        iconName: Icons.info,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertScreen().aboutUsPopUp(context));
                        },
                      ),
                      ReusableDrawerTabs(
                        label: 'Help and Support',
                        iconName: Icons.contact_support,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertScreen().helpAndSupportPopUp(context));
                        },
                      ),
                      ReusableDrawerTabs(
                        label: 'Feedback',
                        iconName: Icons.feedback,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertScreen().feedBackPopUp(context));
                        },
                      ),
                      ReusableDrawerTabs(
                        label: 'Share',
                        iconName: Icons.share,
                        onTap: () {
                          try {
                            share(context);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      ReusableDrawerTabs(
                          label: 'Privacy Policy',
                          iconName: Icons.policy,
                          onTap: () {
                            Navigator.pushNamed(context, 'privacyPolicyScreen');
                          })
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              alignment: Alignment.bottomCenter,
              child: Text(
                'version 1.0.1',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  share(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    String text =
        'https://play.google.com/store/apps/details?id=com.sports.buzz11';
    await Share.share(text,
        subject: 'this is the subject',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
