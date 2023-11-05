import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Recognition')
class RecognitionScreen extends StatelessWidget {
  const RecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        Hidden(),
        Discover(),
        Study(),
        Static(),
      ],
      builder: (context, child) => RecognitionScaffold(child: child),
    );
  }
}
