import 'package:equatable/equatable.dart';

abstract class OrderBlocEvent extends Equatable {
  const OrderBlocEvent();

  @override
  List<Object> get props => [];
}

class OrderListChanged extends OrderBlocEvent {
  const OrderListChanged({required this.orderedList});

  final List<String> orderedList;

  @override
  List<Object> get props => [orderedList];
}
