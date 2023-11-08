import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/domain.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  bool myEmotion = true;
  bool frontCamera = true;

  @override
  void initState() {
    loadCamera(boolToIndex(frontCamera));

    super.initState();
  }

  bool modelLoaded = false;

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  boolToIndex(bool value) {
    if (value) return 1;

    return 0;
  }

  int frameCount = 100;

  void loadCamera(int index) {
    cameraController = CameraController(
      cameras![index],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraController!.initialize().then((value) async {
      if (!mounted) {
        return;
      } else {
        if (!myEmotion) {
          await Tflite.loadModel(
            model: modelNormal,
            labels: modelNormalLabel,
          );
        } else {
          await Tflite.loadModel(
            model: modelAuthistic,
            labels: modelAuthisticLabel,
          );
        }
        setState(() {
          cameraController!.startImageStream((imageStream) async {
            cameraImage = imageStream;

            if (cameraImage != null) {
              await runModel();
              await Future.delayed(const Duration(seconds: 2));
            }
          });
        });
      }
    });
  }

  runModel() async {
    var prediction = await Tflite.runModelOnFrame(
      bytesList: cameraImage!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 5,
      threshold: 0.1,
      asynch: true,
    );
    setState(() {
      output = prediction?.elementAt(0)['label'];
      modelLoaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(cameraController!)),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF91D7E0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  child: Text(
                    output.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF91D7E0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            myEmotion
                                ? 'emotion.my'.tr()
                                : 'emotion.other'.tr(),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                          ),
                          RecognitionSwitch(callback: () async {
                            if (myEmotion) {
                              await Tflite.loadModel(
                                model: modelNormal,
                                labels: modelNormalLabel,
                              );
                            } else {
                              await Tflite.loadModel(
                                model: modelAuthistic,
                                labels: modelAuthisticLabel,
                              );
                            }
                            setState(() {
                              myEmotion = !myEmotion;
                              loadCamera(boolToIndex(frontCamera));
                            });
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF91D7E0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            frontCamera
                                ? 'camera.front'.tr()
                                : 'camera.back'.tr(),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                          ),
                          RecognitionSwitch(callback: () {
                            setState(() {
                              frontCamera = !frontCamera;
                              loadCamera(boolToIndex(frontCamera));
                            });
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryElevatedButton(
                      text: 'button.details'.tr(),
                      callback: () {
                        showAsBottomSheet(
                            context, EmotionName.values.byName(output!));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void showAsBottomSheet(BuildContext context, EmotionName emotionName) async {
  final result = await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.4, 0.7, 1.0],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return SizedBox(
          height: 1600.h,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    (emotionMap[emotionName]!['definition']
                            as Map<String, dynamic>)!['head']
                        .toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SvgPicture.asset(
                      emotionMap[emotionName]!['asset'].toString()),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    (emotionMap[emotionName]!['definition']
                            as Map<String, dynamic>)!['content']
                        .toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Совет",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    (emotionMap[emotionName]!['advice']
                            as Map<String, dynamic>)!['head']
                        .toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    (emotionMap[emotionName]!['advice']
                            as Map<String, dynamic>)!['content']
                        .toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Как изобразить?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    (emotionMap[emotionName]!['guidance']).toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  });
}
