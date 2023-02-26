// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/screens/home.dart';
import 'package:pixelated/screens/order_details.dart';

import 'screens/orders_page.dart';
import 'screens/settings.dart';
import 'widgets/bottom_nav_bar.dart';

class HomeBase extends HookWidget {
  HomeBase({
    super.key,
    required this.pageNum,
  });

  int pageNum;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Home(),
      OrdersPage(),
      Setting(),
    ];
    final ValueNotifier<int> initialPageIndex;
    if (pageNum == 1) {
      initialPageIndex = useState(1);
    } else {
      initialPageIndex = useState(0);
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: MyColors.myCream,
      body: IndexedStack(
        index: initialPageIndex.value,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(pageIndex: initialPageIndex),
      resizeToAvoidBottomInset: false,
    );
  }
}
