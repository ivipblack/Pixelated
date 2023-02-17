// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixelated/screens/home.dart';
import 'package:pixelated/screens/order_details.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeBase extends HookWidget {
  const HomeBase({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Home(),
      OrderDetails(),
      OrderDetails(),
      OrderDetails(),
      OrderDetails(),
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
