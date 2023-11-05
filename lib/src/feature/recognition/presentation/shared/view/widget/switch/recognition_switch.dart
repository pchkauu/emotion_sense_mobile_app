import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecognitionSwitch extends StatefulWidget {
  final VoidCallback callback;

  const RecognitionSwitch({
    super.key,
    required this.callback,
  });

  @override
  State<RecognitionSwitch> createState() => _RecognitionSwitchState();
}

class _RecognitionSwitchState extends State<RecognitionSwitch> {
  bool value = false;
  late final MaterialAccentColor activeColor;
  late final MaterialColor trackColor;

  @override
  void initState() {
    activeColor = Colors.accents[Random().nextInt(Colors.accents.length)];
    trackColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    super.initState();
  }

  void onChanged(value) {
    if (this.value == value) return;

    setState(() {
      this.value = value;
    });

    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 1.25,
      scaleY: 1.25,
      origin: Offset(16.w, 0),
      child: CupertinoSwitch(
        activeColor: activeColor,
        trackColor: trackColor,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
