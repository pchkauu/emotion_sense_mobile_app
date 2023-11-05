import 'package:emotion_sense_mobile_app/src/feature/recognition/domain/shared/entity/entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hidden_event.dart';
part 'hidden_state.dart';

class HiddenBloc extends Bloc<HiddenEvent, HiddenState> {
  HiddenBloc()
      : super(
          const HiddenInitial(
            myEmotion: true,
            frontCamera: true,
          ),
        ) {
    on<HiddenToggleEvent>(
      (event, emit) => const HiddenInitial(
        myEmotion: false,
        frontCamera: false,
      ),
    );

    on<HiddenResetEvent>(
      (event, emit) => emit(
        const HiddenInitial(
          myEmotion: true,
          frontCamera: true,
        ),
      ),
    );

    on<HiddenRecognizeEvent>((event, emit) async {
      if (state is! HiddenPending) {
        emit(HiddenPending());
      }

      await Future.delayed(const Duration(seconds: 2));

      emit(HiddenFailure());
    });
  }
}
