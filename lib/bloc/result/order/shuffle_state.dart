import 'package:equatable/equatable.dart';

class OrderBlocState extends Equatable {
  const OrderBlocState({required this.orderList});

  final List<String> orderList;

  @override
  List<Object> get props => [orderList];
}
