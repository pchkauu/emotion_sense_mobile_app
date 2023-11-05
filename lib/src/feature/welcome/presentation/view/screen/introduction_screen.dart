import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Introduction')
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroductionScaffold();
  }
}
