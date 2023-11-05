part of 'hidden_bloc.dart';

abstract class HiddenEvent extends Equatable {
  const HiddenEvent();
}

class HiddenToggleEvent extends HiddenEvent {
  final EmotionType emotionType;
  final CameraType cameraType;

  const HiddenToggleEvent({
    required this.emotionType,
    required this.cameraType,
  });

  @override
  List<Object?> get props => [
        emotionType,
        cameraType,
      ];
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
