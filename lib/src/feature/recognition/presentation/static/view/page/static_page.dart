import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/domain.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/static/controller/bloc/static_bloc.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:tflite_v2/tflite_v2.dart';

@RoutePage(name: 'Static')
class StaticPage extends StatelessWidget {
  const StaticPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = StaticBloc();

    return RecognitionBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: BlocBuilder<StaticBloc, StaticState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is StaticInitial) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'static.headline'.tr(),
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'static.subheadline'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'static.description'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    Lottie.asset('assets/ui_kit/lottie/upload.json',
                        width: 128.w, frameRate: FrameRate(140)),
                    TextButton(
                      onPressed: () async {
                        bloc.add(const StaticStartEvent());
                      },
                      child: Text(
                        'button.load'.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 32.sp,
                            ),
                      ),
                    ),
                  ],
                );
              }

              if (state is StaticFailure) {
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
                                'failure.title'.tr(),
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
                                        bloc.add(const StaticResetEvent())),
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

              if (state is StaticLoaded) {
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
                                state.emotionName.name.tr(),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: PrimaryElevatedButton(
                                      text: 'button.details'.tr(),
                                      callback: () {
                                        showAsBottomSheet(
                                            context, state.emotionName);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: PrimaryElevatedButton(
                                        text: 'failure.try_again'.tr(),
                                        callback: () =>
                                            bloc.add(const StaticResetEvent())),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(
                              emotionMap[state.emotionName]!['asset']
                                  .toString()),
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
