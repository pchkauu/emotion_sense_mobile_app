import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Recognition')
class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  int _selectedPageIndex = 0;

  void openPage({
    required int index,
    required TabsRouter tabsRouter,
  }) =>
      setState(() {
        tabsRouter.setActiveIndex(index);
      });

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        Hidden(),
        Discover(),
        Study(),
        Static(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => openPage(
              index: index,
              tabsRouter: tabsRouter,
            ),
            items: [
              BottomNavigationBarItem(
                label: 'asd',
                icon: Icon(Icons.abc),
              ),
              BottomNavigationBarItem(
                label: 'asd',
                icon: Icon(Icons.abc),
              ),
              BottomNavigationBarItem(
                label: 'asd',
                icon: Icon(Icons.abc),
              ),
              BottomNavigationBarItem(
                label: 'asd',
                icon: Icon(Icons.abc),
              ),
            ],
          ),
        );
      },
    );
  }
}
