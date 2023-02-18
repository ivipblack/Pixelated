import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

GestureDetector AccountOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              //titlePadding: const EdgeInsets.only(left: 80, top: 30),
              backgroundColor: const Color.fromARGB(157, 227, 255, 225),
              title: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: TextField(
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      onChanged: (value) {},
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Set',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 62, 62, 62),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color.fromARGB(255, 62, 62, 62),
            size: 24,
            weight: 90,
          ),
        ],
      ),
    ),
  );
}

Padding PreferencesToggle(
    String title, bool status, Function onChangeFunction) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 11,
      horizontal: 25,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 62, 62, 62),
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
              activeColor: Colors.black,
              trackColor: Colors.grey,
              value: status,
              onChanged: (bool newValue) {
                onChangeFunction(newValue);
              }),
        )
      ],
    ),
  );
}

GestureDetector HelpOption(
  BuildContext context,
  String title,
  String text,
) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //titlePadding: const EdgeInsets.only(left: 80, top: 30),
            backgroundColor: const Color.fromARGB(218, 227, 255, 225),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    text,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'close',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 62, 62, 62),
            ),
          ),
          const Icon(
            Icons.document_scanner,
            color: Color.fromARGB(255, 62, 62, 62),
            size: 24,
            weight: 90,
          ),
        ],
      ),
    ),
  );
}

class _SettingState extends State<Setting> {
  bool toogleStatus1 = false;
  bool toogleStatus2 = false;
  bool toogleStatus3 = true;

  onChangeFunction1(bool newStatus1) {
    setState(() {
      toogleStatus1 = newStatus1;
    });
  }

  onChangeFunction2(bool newStatus2) {
    setState(() {
      toogleStatus2 = newStatus2;
    });
  }

  onChangeFunction3(bool newStatus3) {
    setState(() {
      toogleStatus3 = newStatus3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "Settings",
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                // Kfupm account setting
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    SizedBox(width: 18),
                    Icon(Icons.person, color: Colors.black, size: 36),
                    SizedBox(width: 9),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                      height: 23,
                      thickness: 1,
                      color: Color.fromARGB(255, 93, 92, 92)),
                ),
                AccountOption(context, 'Change email'),
                AccountOption(context, 'Change phone number'),
                AccountOption(context, 'Set default address'),
                AccountOption(context, 'Set default meal'),

                // look preferences setting
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    SizedBox(width: 18),
                    Icon(Icons.looks, color: Colors.black, size: 36),
                    SizedBox(width: 9),
                    Text(
                      "Preferences",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                      height: 23,
                      thickness: 1,
                      color: Color.fromARGB(255, 93, 92, 92)),
                ),
                PreferencesToggle(
                  "Theme Dark",
                  toogleStatus1,
                  onChangeFunction1,
                ),
                PreferencesToggle(
                  "Receive Orders",
                  toogleStatus2,
                  onChangeFunction2,
                ),
                PreferencesToggle(
                  "Receive Notification",
                  toogleStatus3,
                  onChangeFunction3,
                ),
                // look preferences setting
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    SizedBox(width: 18),
                    Icon(Icons.help_center, color: Colors.black, size: 36),
                    SizedBox(width: 9),
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Divider(
                      height: 23,
                      thickness: 1,
                      color: Color.fromARGB(255, 93, 92, 92)),
                ),

                HelpOption(
                  context,
                  "Help Center",
                  "FAQ",
                ),
                HelpOption(
                  context,
                  "Contact Us",
                  "013 938 9234",
                ),
                HelpOption(
                  context,
                  "Privacy Policy",
                  "no rules",
                ),

                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text(
                      "SIGN OUT",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.1,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
