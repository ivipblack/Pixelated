import 'package:flutter/material.dart';
import 'package:pixelated/screens/home.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.pageIndex});

  final ValueNotifier pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Something',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Something',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt),
            label: 'Something',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) => pageIndex.value = index,
        currentIndex: pageIndex.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
      ),
    );
  }
}
