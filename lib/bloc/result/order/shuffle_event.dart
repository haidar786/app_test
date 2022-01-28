import 'package:equatable/equatable.dart';

abstract class OrderBlocEvent extends Equatable {
  const OrderBlocEvent();

  @override
  List<Object> get props => [];
}

class OrderListChanged extends OrderBlocEvent {
  const OrderListChanged(
      {required this.orderedList, required this.originalSentence});

  final List<String> orderedList;
  final String originalSentence;

  @override
  List<Object> get props => [orderedList, originalSentence];
}
