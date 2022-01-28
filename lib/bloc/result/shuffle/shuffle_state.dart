import 'package:equatable/equatable.dart';

class ShuffleBlocState extends Equatable {
  const ShuffleBlocState(
      {required this.randomList, required this.originalRandomList});

  final List<String> randomList;
  final List<String> originalRandomList;

  @override
  List<Object> get props => [randomList];
}
