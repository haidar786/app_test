import 'package:equatable/equatable.dart';

abstract class ShuffleBlocEvent extends Equatable {
  const ShuffleBlocEvent();

  @override
  List<Object> get props => [];
}

class ShuffleListChanged extends ShuffleBlocEvent {
  const ShuffleListChanged(
      {required this.randomList, required this.originalRandomList});

  final List<String> randomList;
  final List<String> originalRandomList;

  @override
  List<Object> get props => [randomList, originalRandomList];
}
