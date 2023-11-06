import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecognitionNavigationBar extends StatefulWidget {
  const RecognitionNavigationBar({super.key});

  @override
  State<RecognitionNavigationBar> createState() =>
      _RecognitionNavigationBarState();
}

class _RecognitionNavigationBarState extends State<RecognitionNavigationBar> {
  late int _selectedPageIndex;

  @override
  void initState() {
    _selectedPageIndex = 0;
    super.initState();
  }

  void openPage({
    required int index,
    required TabsRouter tabsRouter,
  }) {
    if (_selectedPageIndex == index) return;

    setState(() {
      tabsRouter.setActiveIndex(index);
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          24.r,
        ),
        topRight: Radius.circular(
          24.r,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.amber,
        currentIndex: AutoTabsRouter.of(context).activeIndex,
        backgroundColor: const Color(0xFF91D7E0),
        onTap: (index) => openPage(
          index: index,
          tabsRouter: AutoTabsRouter.of(context),
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Hidden',
            icon: SizedBox(
              width: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/hidden.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            activeIcon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/hidden_selected.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/discover.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            activeIcon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/discover_selected.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Study',
            icon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/study.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            activeIcon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/study_selected.svg',
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Static',
            icon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/static.svg',
                ),
              ),
            ),
            activeIcon: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/static_selected.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
