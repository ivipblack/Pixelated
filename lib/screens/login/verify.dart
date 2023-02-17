// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pinput/pinput.dart';
import 'package:pixelated/home_base.dart';

import '../../widgets/custom_button.dart';

class verificationView extends StatefulWidget {
  verificationView({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<verificationView> createState() => _verificationViewState();
}

class _verificationViewState extends State<verificationView> {
  String _verificationCode = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(255, 255, 255, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(96, 96, 96, 0.314),
      ),
    );
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.042,
                MediaQuery.of(context).size.height * 0.01,
                MediaQuery.of(context).size.height * 0.042,
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Column(
                // axis

                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Verification Code Sent',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.034,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please enter the code sent to +966${widget.phoneNumber}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color(0XFFADADAD),

                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: _verificationCode,
                                  smsCode: pin);
                          await FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) async {
                            if (value.user != null) {
                              // Navigator.pushNamed(context, '/home');
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeBase()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          // _scaffoldKey.currentState!.sho
                          // .showSnackBar(SnackBar(content: Text('Invalid code')));
                        }
                      },
                    ),
                  ),
                  CustomButton(
                      label: 'Sign in',
                      onPressed: () {
                        // push context to
                        Navigator.pushNamed(context, '/verify');
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+966${widget.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              // Navigator.pushNamed(context, '/home');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeBase()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            _verificationCode = verificationId;
          });
          // Update the UI - wait for the user to enter the SMS code
          // String? smsCode = 'xxxx';

          // Create a PhoneAuthCredential with the code
          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          // await FirebaseAuth.instance
          //     .signInWithCredential(credential)
          //     .then((value) async {
          //   if (value.user != null) {
          //     Navigator.pushNamed(context, '/home');
          //   }
          // });
        },
        // codeAutoRetrievalTimeout: (String verificationId) {},
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationCode = verificationId;
          }); // Auto-resolution timed out...
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }
}
