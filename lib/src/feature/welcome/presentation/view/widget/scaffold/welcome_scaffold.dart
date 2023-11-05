import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/view/widget/floating/welcome_floating_button.dart';
import 'package:flutter/material.dart';

class WelcomeScaffold extends StatelessWidget {
  const WelcomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WelcomeFloatingButton(),
    );
  }
}
