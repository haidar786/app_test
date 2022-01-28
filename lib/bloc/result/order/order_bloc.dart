import 'package:app_test/bloc/result/order/shuffle_event.dart';
import 'package:app_test/bloc/result/order/shuffle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderBlocEvent, OrderBlocState> {
  OrderBloc() : super(const OrderBlocState(orderList: [])) {
    on<OrderListChanged>(_onOrderListChanged);
  }

  void _onOrderListChanged(
      OrderListChanged event, Emitter<OrderBlocState> emit) {
    emit(OrderBlocState(orderList: event.orderedList));
  }
}
