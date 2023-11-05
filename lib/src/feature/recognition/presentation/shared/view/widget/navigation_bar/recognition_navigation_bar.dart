import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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
      child: SizedBox(
        height: 96.h,
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.amber,
          currentIndex: AutoTabsRouter.of(context).activeIndex,
          onTap: (index) => openPage(
            index: index,
            tabsRouter: AutoTabsRouter.of(context),
          ),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF91D7E0),
              label: 'asd',
              icon: SizedBox(
                  width: 48.w,
                  height: 48.h,
                  child:
                      SvgPicture.asset('assets/ui_kit/navigation/hidden.svg')),
              activeIcon: SizedBox(
                width: 48.w,
                height: 48.h,
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/hidden_selected.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF91D7E0),
              label: 'asd',
              icon: SizedBox(
                width: 48.w,
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/discover.svg',
                  height: 32.h,
                ),
              ),
              activeIcon: SizedBox(
                width: 48.w,
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/discover_selected.svg',
                  allowDrawingOutsideViewBox: true,
                  height: 32.h,
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF91D7E0),
              label: 'asd',
              icon: SizedBox(
                  child: Center(
                      child: SvgPicture.asset(
                          'assets/ui_kit/navigation/lesson.svg'))),
              activeIcon: SizedBox(
                width: 48.w,
                child: SvgPicture.asset(
                  'assets/ui_kit/navigation/study_selected.svg',
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF91D7E0),
              label: 'asd',
              icon: SizedBox(width: 48.w, child: Icon(Icons.abc)),
            ),
          ],
        ),
      ),
    );
  }
}
