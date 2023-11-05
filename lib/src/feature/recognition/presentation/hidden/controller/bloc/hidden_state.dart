part of 'hidden_bloc.dart';

abstract class HiddenState extends Equatable {
  const HiddenState();
}

class HiddenInitial extends HiddenState {
  @override
  List<Object?> get props => [];
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
