import 'package:app_test/bloc/result/order/order_bloc.dart';
import 'package:app_test/bloc/result/order/shuffle_event.dart';
import 'package:app_test/bloc/result/order/shuffle_state.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_bloc.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_event.dart';
import 'package:app_test/model/drag_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPageTargetSplitWordsList extends StatelessWidget {
  const ResultPageTargetSplitWordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderBlocState>(
        builder: (BuildContext context, state) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DragTarget<DragData>(
            onAcceptWithDetails: (details) {
              print(details.offset);
              if (details.data.isSwap) {
                print(details.data.isSwap);
                print(details.data.index);
                print(details.data.text);
              } else {
                final shuffleState = context.read<ShuffleBloc>().state;
                final newOrderList = <String>[];
                newOrderList.addAll(state.orderList);
                newOrderList.add(shuffleState.randomList[details.data.index]);
                context.read<OrderBloc>().add(OrderListChanged(
                    orderedList: newOrderList,
                    originalSentence: state.originalSentence));
                final newCheckList = <int>[];
                newCheckList.addAll(shuffleState.checkRandomList);
                newCheckList.add(details.data.index);
                context.read<ShuffleBloc>().add(ShuffleListChanged(
                    randomList: shuffleState.randomList,
                    checkRandomList: newCheckList));
              }
            },
            builder: (BuildContext context, List<Object?> candidateData,
                List<dynamic> rejectedData) {
              return Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all()),
                child: Wrap(
                  children: List.generate(state.orderList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Draggable(
                        data: DragData(
                            isSwap: true,
                            text: state.orderList[index],
                            index: index),
                        feedback: Material(
                          child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.green.shade50,
                                  border: Border.all()),
                              child: Text(state.orderList[index])),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.red.shade50,
                                border: Border.all()),
                            child: Text(state.orderList[index])),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
