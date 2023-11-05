import 'package:equatable/equatable.dart';

class Emotion extends Equatable {
  final EmotionName name;

  const Emotion({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

enum EmotionName {
  neutral,
  sad,
  happy,
}

enum EmotionType {
  normal,
  authistic,
}
