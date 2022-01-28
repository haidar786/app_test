import 'package:equatable/equatable.dart';

class ShuffleBlocState extends Equatable {
  const ShuffleBlocState(
      {required this.randomList, required this.checkRandomList});

  final List<String> randomList;
  final List<int> checkRandomList;

  @override
  List<Object> get props => [randomList, checkRandomList];
}
