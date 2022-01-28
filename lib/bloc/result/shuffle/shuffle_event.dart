import 'package:equatable/equatable.dart';

abstract class ShuffleBlocEvent extends Equatable {
  const ShuffleBlocEvent();

  @override
  List<Object> get props => [];
}

class ShuffleListChanged extends ShuffleBlocEvent {
  const ShuffleListChanged(
      {required this.randomList, required this.checkRandomList});

  final List<String> randomList;
  final List<int> checkRandomList;

  @override
  List<Object> get props => [randomList, checkRandomList];
}
