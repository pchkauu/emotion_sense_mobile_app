part of 'hidden_bloc.dart';

abstract class HiddenEvent extends Equatable {
  const HiddenEvent();
}

class HiddenResetEvent extends HiddenEvent {
  const HiddenResetEvent();

  @override
  List<Object?> get props => [];
}

class HiddenRecognizeEvent extends HiddenEvent {
  final CameraType cameraType;
  final EmotionType emotionType;

  const HiddenRecognizeEvent({
    required this.cameraType,
    required this.emotionType,
  });

  @override
  List<Object?> get props => [
        cameraType,
        emotionType,
      ];
}
