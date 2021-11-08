import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Login_screen.dart';


class SendOtp extends StatelessWidget {
  String email;
  SendOtp(this.email);

  TextEditingController _otpController = TextEditingController();
  //TextEditingController _emailController = TextEditingController();

  EmailAuth emailAuth = new EmailAuth(sessionName: '');
  //Send OTP to Auth Email
  void sendOTP() async {
    emailAuth.sessionName = "JordanTimes";

    var res = await emailAuth.sendOtp(recipientMail:email);
    if (res) {
      print("OTP sent");
    } else {
      print("Invalid OTP");
    }
  }
// Verify User OTP 
  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail:email, userOtp: _otpController.text);
    if (res) {
      print("OTP verified");
    } else {
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send OTP'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('assets/amman.png'),
            ),
           
            SizedBox(
              height: 48.0,
            ),
           
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                _otpController.text = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your OTP',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

             TextButton(
                onPressed: () {
                  sendOTP();
                },
                child: Text('Send OTP')),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    verifyOTP();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Verify OTP',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
