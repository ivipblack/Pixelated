// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeBase extends HookWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    final initialPageIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            'Plans',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Text('body'),
      bottomNavigationBar: BottomNavBar(pageIndex: initialPageIndex),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
