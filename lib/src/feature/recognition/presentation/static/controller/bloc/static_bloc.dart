import 'package:emotion_sense_mobile_app/src/core/core.dart';
import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class StaticBloc extends Bloc<StaticEvent, StaticState> {
  StaticBloc() : super(const StaticInitial()) {
    on<StaticResetEvent>((event, emit) => emit(const StaticInitial()));
    on<StaticStartEvent>((event, emit) async {
      try {
        final ImagePicker imagePicker = ImagePicker();
        final picked = await imagePicker.pickImage(source: ImageSource.gallery);

        emit(const StaticPending());

        final bytes = await picked?.readAsBytes();

        if (bytes == null || picked == null) {
          emit(StaticFailure());
          return;
        }
        var prediction = await Tflite.runModelOnImage(
          path: picked.path,
          numResults: 5,
          threshold: 0.1,
          asynch: true,
        );

        L.info(message: prediction?.elementAt(0)['label'].toString());

        await Future.delayed(const Duration(seconds: 3));

        emit(StaticLoaded(
            emotionName: EmotionName.values
                .byName(prediction!.elementAt(0)['label'].toString())));
      } catch (e) {
        emit(StaticFailure());
      }
    });
  }
}

abstract class StaticEvent extends Equatable {
  const StaticEvent();
}

class StaticStartEvent extends StaticEvent {
  const StaticStartEvent();

  @override
  List<Object?> get props => [];
}

class StaticResetEvent extends StaticEvent {
  const StaticResetEvent();

  @override
  List<Object?> get props => [];
}

abstract class StaticState extends Equatable {
  const StaticState();
}

class StaticInitial extends StaticState {
  const StaticInitial();
  @override
  List<Object?> get props => [];
}

class StaticPending extends StaticState {
  const StaticPending();

  @override
  List<Object?> get props => [];
}

class StaticLoaded extends StaticState {
  final EmotionName emotionName;

  const StaticLoaded({
    required this.emotionName,
  });

  @override
  List<Object?> get props => [
        emotionName,
      ];
}

class StaticFailure extends StaticState {
  @override
  List<Object?> get props => [];
}
