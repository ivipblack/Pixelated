// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.pageIndex});

  final ValueNotifier pageIndex;

  @override
  Widget build(BuildContext context) {
    void onBottomNavTap(int index) {
      pageIndex.value = index;
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/1');
          break;
        case 2:
          context.go('/2');
          break;
        case 3:
          context.go('/3');
          break;
        case 4:
          context.go('/4');
          break;
      }
    }

    // return Container(
    //   decoration: BoxDecoration(
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.2),
    //         offset: const Offset(0, 0),
    //         blurRadius: 10,
    //         spreadRadius: 0,
    //       ),
    //     ],
    //   ),
    //   child: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.flash_on),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.check_circle_outline),
    //         label: 'Something',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.date_range),
    //         label: 'Something',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.view_quilt),
    //         label: 'Something',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.settings),
    //         label: 'Settings',
    //       ),
    //     ],
    //     onTap: ((value) => onBottomNavTap(value)),
    //     currentIndex: pageIndex.value,
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: Colors.blueGrey,
    //     selectedItemColor: Colors.white,
    //     unselectedItemColor: Colors.grey,
    //     selectedFontSize: 12,
    //   ),
    // );
    // make a bottom nav bar with a border radius of 32
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 0),
                blurRadius: 21,
                spreadRadius: -4,
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                height: 79,
                decoration: BoxDecoration(
                  color: MyColors.myWhite,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Vector-1.svg',
                                color: pageIndex.value == 1
                                    ? Colors.grey
                                    : Colors.grey.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: pageIndex.value == 0
                                      ? MyColors.myOrange
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: pageIndex.value == 0
                                      ? [
                                          BoxShadow(
                                            color: Color(0xFFB13B3B),
                                            offset: const Offset(0, 0),
                                            blurRadius: 6,
                                            spreadRadius: -1,
                                          ),
                                        ]
                                      : [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => onBottomNavTap(0),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Vector-2.svg',
                                color: pageIndex.value == 1
                                    ? Colors.grey
                                    : Colors.grey.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: pageIndex.value == 1
                                      ? MyColors.myOrange
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: pageIndex.value == 1
                                      ? [
                                          BoxShadow(
                                            color: Color(0xFFB13B3B),
                                            offset: const Offset(0, 0),
                                            blurRadius: 6,
                                            spreadRadius: -1,
                                          ),
                                        ]
                                      : [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => onBottomNavTap(1),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Vector.svg',
                                color: pageIndex.value == 2
                                    ? Colors.grey
                                    : Colors.grey.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: pageIndex.value == 2
                                      ? MyColors.myOrange
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: pageIndex.value == 2
                                      ? [
                                          BoxShadow(
                                            color: Color(0xFFB13B3B),
                                            offset: const Offset(0, 0),
                                            blurRadius: 6,
                                            spreadRadius: -1,
                                          ),
                                        ]
                                      : [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => onBottomNavTap(2),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
