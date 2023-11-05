import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: child,
          ),
        ),
      ),
      bottomNavigationBar: const RecognitionNavigationBar(),
    );
  }
}
