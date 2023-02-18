// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixelated/screens/home.dart';
import 'package:pixelated/screens/order_details.dart';
import 'package:pixelated/screens/settings.dart';

import 'screens/orders_page.dart';
import 'widgets/bottom_nav_bar.dart';

class HomeBase extends HookWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Home(),
      OrdersPage(),
      Setting(),
    ];

    final initialPageIndex = useState(0);

    return Scaffold(
      body: IndexedStack(
        index: initialPageIndex.value,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(pageIndex: initialPageIndex),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
