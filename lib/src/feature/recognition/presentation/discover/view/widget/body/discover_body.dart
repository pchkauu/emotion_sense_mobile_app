import 'package:camera/camera.dart';
import 'package:dartx/dartx_io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/presentation/presentation.dart';
import 'package:emotion_sense_mobile_app/src/feature/shared/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  boolToIndex(bool value) {
    if (value) return 1;

    return 0;
  }

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
    prediction?.forEach((element) {
      L.info(message: element.toString());
      output = element['label'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              output.tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                child: Container(
                    width: 225.w,
                    height: 400.h,
                    child: CameraPreview(cameraController!)),
              ),
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
                      myEmotion ? 'emotion.my'.tr() : 'emotion.other'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
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
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      frontCamera ? 'camera.front'.tr() : 'camera.back'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
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
                SizedBox(
                  height: 16.h,
                ),
                PrimaryElevatedButton(
                  text: 'button.details'.tr(),
                  callback: () {
                    showAsBottomSheet(context);
                  },
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  void showAsBottomSheet(BuildContext context) async {
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
          return Container(
            height: 400,
            child: Center(
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.pop(context, 'This is the result.'),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'This is the content of the sheet',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });

    print(result); // This is the result.
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey.shade200,
    appBar: AppBar(
      title: Text('Simple Example'),
    ),
    body: SlidingSheet(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        // Enable snapping. This is true by default.
        snap: true,
        // Set custom snapping points.
        snappings: [0.4, 0.7, 1.0],
        // Define to what the snappings relate to. In this case,
        // the total available space that the sheet can expand to.
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      // The body widget will be displayed under the SlidingSheet
      // and a parallax effect can be applied to it.
      body: Center(
        child: Text('This widget is below the SlidingSheet'),
      ),
      builder: (context, state) {
        // This is the content of the sheet that will get
        // scrolled, if the content is bigger than the available
        // height of the sheet.
        return Container(
          height: 500,
          child: Center(
            child: Text('This is the content of the sheet'),
          ),
        );
      },
    ),
  );
}
