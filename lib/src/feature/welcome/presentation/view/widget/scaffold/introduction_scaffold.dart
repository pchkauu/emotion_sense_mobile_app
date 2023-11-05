import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:flutter/material.dart';

class IntroductionScaffold extends StatelessWidget {
  const IntroductionScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroductionBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: IntroductionFloatingButton(),
    );
  }
}
