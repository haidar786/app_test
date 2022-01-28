import 'package:app_test/bloc/result/shuffle/shuffle_event.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShuffleBloc extends Bloc<ShuffleBlocEvent, ShuffleBlocState> {
  ShuffleBloc(List<String> randomList)
      : super(ShuffleBlocState(
            randomList: randomList, checkRandomList: const <int>[])) {
    on<ShuffleListChanged>(_onRandomListChanged);
  }

  void _onRandomListChanged(
      ShuffleListChanged event, Emitter<ShuffleBlocState> emit) {
    emit(ShuffleBlocState(
        randomList: event.randomList,
        checkRandomList: event.checkRandomList));
  }
}
