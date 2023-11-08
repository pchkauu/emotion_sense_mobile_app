import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/domain.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
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

    return RecognitionBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: BlocBuilder<HiddenBloc, HiddenState>(
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
                        'hidden.headline'.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'hidden.subheadline'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(height: 1.5),
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
                              Text(
                                state.myEmotion
                                    ? 'emotion.my'.tr()
                                    : 'emotion.other'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              RecognitionSwitch(
                                  callback: () => bloc.add(HiddenToggleEvent(
                                      emotionType: EmotionType.authistic,
                                      cameraType: CameraType.front))),
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
                              Text(
                                state.frontCamera
                                    ? 'camera.front'.tr()
                                    : 'camera.back'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              RecognitionSwitch(callback: () {}),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          PrimaryElevatedButton(
                            text: 'button.recognize'.tr(),
                            callback: () {
                              bloc.add(
                                const HiddenRecognizeEvent(
                                  cameraType: CameraType.back,
                                  emotionType: EmotionType.normal,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              }

              if (state is HiddenFailure) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
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
                                'В разработке',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: PrimaryElevatedButton(
                                    text: 'failure.try_again'.tr(),
                                    callback: () =>
                                        bloc.add(const HiddenResetEvent())),
                              )
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child:
                              Lottie.asset('assets/ui_kit/lottie/failure.json'),
                        ),
                      ),
                    ],
                  ),
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
                        'analize'.tr(),
                        style: Theme.of(context).textTheme.headlineLarge,
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
          ),
        ),
      ),
    );
  }
}
