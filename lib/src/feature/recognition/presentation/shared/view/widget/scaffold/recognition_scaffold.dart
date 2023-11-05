import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:flutter/material.dart';

class RecognitionScaffold extends StatelessWidget {
  final Widget child;

  const RecognitionScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecognitionBackground(
        child: SafeArea(
          child: child,
        ),
      ),
      bottomNavigationBar: const RecognitionNavigationBar(),
    );
  }
}
