import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class ContactusScreen extends StatelessWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'JordanTimes',
        textColor: Colors.white,
        backgroundColor: Colors.red,
        email: 'sma302000@gmail.com',
        // textFont: 'Sail',
      ),
      backgroundColor: Colors.red,
      body: ContactUs(
          cardColor: Colors.white,
          textColor: Colors.red,
          logo: AssetImage('assets/amman.png'),
          email: 'sam20180844@std.psut.edu.jo',
          companyName: 'Sama Mansour',
          companyColor: Colors.red,
          dividerThickness: 2,
          phoneNumber: '+962798095012',
          website: 'https://jordantimes.xyz.com',
          githubUserName: '',
          linkedinURL: ' ',
          tagLine: 'Tourisim Connecter',
          taglineColor: Colors.red,
          twitterHandle: 'JordanTimes@21',
          instagram: '_JordanTimes',
          facebookHandle: '_JordanTimes'),
    );
  }
}
