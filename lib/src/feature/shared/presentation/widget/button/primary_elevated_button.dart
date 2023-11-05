import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: primaryElevatedButtonStyle,
      onPressed: callback,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 76.h,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
