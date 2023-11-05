import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/shared/entity/entity.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'Hidden')
class HiddenPage extends StatelessWidget {
  const HiddenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = HiddenBloc();

    return BlocBuilder<HiddenBloc, HiddenState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is HiddenInitial) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Камера скрыта',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Для вашего комфорта мы скрыли отображение изображения с камеры',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Мои эмоции'),
                        RecognitionSwitch(callback: () {}),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Фронтальная камера'),
                        RecognitionSwitch(callback: () {}),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          bloc.add(HiddenRecognizeEvent(
                              cameraType: CameraType.back,
                              emotionType: EmotionType.normal));
                        },
                        child: Center(
                          child: Text('Распознать'),
                        ))
                  ],
                )
              ],
            ),
          );
        }

        if (state is HiddenFailure) {
          return Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ошибка',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => bloc.add(const HiddenResetEvent()),
                        child: Center(child: Text('Try Again')),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Lottie.asset('assets/ui_kit/lottie/failure.json'),
                ),
              ),
            ],
          );
        }

        return Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Анализ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Lottie.asset('assets/ui_kit/lottie/loading.json'),
              ),
            ),
          ],
        );
      },
    );
  }
}
