import 'package:app_test/bloc/result/order/order_bloc.dart';
import 'package:app_test/bloc/result/order/shuffle_event.dart';
import 'package:app_test/bloc/result/order/shuffle_state.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_bloc.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_event.dart';
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
          child: DragTarget<int>(
            onAccept: (data) {
              // desiredList.add(randomList[data]);
              // randomList.removeAt(data);
              final shuffleState = context.read<ShuffleBloc>().state;
              state.orderList.add(shuffleState.randomList[data]);
              shuffleState.randomList.removeAt(data);
              context
                  .read<OrderBloc>()
                  .add(OrderListChanged(orderedList: state.orderList));
              context.read<ShuffleBloc>().add(ShuffleListChanged(
                  randomList: shuffleState.randomList,
                  originalRandomList: shuffleState.originalRandomList));
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
                  children: state.orderList.map((element) {
                    return Draggable(
                      feedback: Material(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green.shade50,
                                border: Border.all()),
                            child: Text(element)),
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade50,
                              border: Border.all()),
                          child: Text(element)),
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
