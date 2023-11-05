part of 'hidden_bloc.dart';

abstract class HiddenState extends Equatable {
  const HiddenState();
}

class HiddenInitial extends HiddenState {
  final bool myEmotion;
  final bool frontCamera;

  const HiddenInitial({
    required this.myEmotion,
    required this.frontCamera,
  });
  @override
  List<Object?> get props => [
        myEmotion,
        frontCamera,
      ];
}

class HiddenPending extends HiddenState {
  @override
  List<Object?> get props => [];
}

class HiddenLoaded extends HiddenState {
  final Emotion emotion;

  const HiddenLoaded({
    required this.emotion,
  });

  @override
  List<Object?> get props => [
        emotion,
      ];
}

class HiddenFailure extends HiddenState {
  @override
  List<Object?> get props => [];
}
