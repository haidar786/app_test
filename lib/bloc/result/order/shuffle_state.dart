import 'package:equatable/equatable.dart';

class OrderBlocState extends Equatable {
  const OrderBlocState(
      {required this.orderList, required this.originalSentence});

  final List<String> orderList;
  final String originalSentence;

  @override
  List<Object> get props => [orderList, originalSentence];
}
