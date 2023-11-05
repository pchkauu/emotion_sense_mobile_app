import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/feature/welcome/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionBody extends StatelessWidget {
  const IntroductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntroductionBackground(
      child: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Добро пожаловать в EmotionSense - уникальное приложение, специально разработанное для людей с расстройством аутистического спектра!'
                    .tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 32.w,
                  bottom: 64.w,
                ),
                child: Text(
                  'Мы понимаем, что распознавание эмоций может представлять трудность, и именно поэтому мы создали это приложение, чтобы помочь вам лучше понимать и взаимодействовать с эмоциональными аспектами окружающего мира.'
                      .tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
