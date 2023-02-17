import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelated/home_base.dart';
import 'package:pixelated/screens/login/verify.dart';
import 'package:pixelated/widgets/custom_button.dart';
import 'package:pixelated/widgets/custom_textfield.dart';

import '../../main.dart';
import '../../widgets/custom_textformfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  bool checkBoxValue = false;

  void dispose() {
    userEmailController.dispose();
    userPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make a transparent app bar  wit a back button

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
              child: SingleChildScrollView(
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
                        'We’ll need your phone\n number and student ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.034,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'To make sure you\'re a student',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color(0XFFADADAD),

                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            // MediaQuery.of(context).size.width * 0.042,
                            0,
                            MediaQuery.of(context).size.height * 0.04,
                            // MediaQuery.of(context).size.width * 0.042,
                            0,
                            MediaQuery.of(context).size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                                label: 'Email',
                                hint: 'Enter your email',
                                isPassword: false,
                                controller: userEmailController),

                            CustomTextFormField(
                                label: 'Password',
                                hint: 'Enter your password',
                                isPassword: true,
                                controller: userPasswordController),
                            // CustomTextField(
                            //     label: 'Phone Number',
                            //     hint: 'Enter Phone Number',
                            //     isPassword: false,
                            //     controller: phoneNumberController),
                            Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: const VisualDensity(
                                        horizontal: -4, vertical: -4),
                                    value: checkBoxValue,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          checkBoxValue = value!;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.009,
                                ),
                                Text(
                                  'Stay logged in?',
                                  style: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.017,
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                                label: 'Sign in',
                                onPressed: () {
                                  // push context to
                                  signIn();
                                }),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmailController.text.trim(),
        password: userPasswordController.text.trim(),
      );
      // get customer data from firebase and store it in the customer object
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
