import 'package:app_test/bloc/result/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPageCheckButton extends StatelessWidget {
  const ResultPageCheckButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final state = BlocProvider.of<OrderBloc>(context).state;
        String orderedSentence = "";
        for (var element in state.orderList) {
          orderedSentence = "$orderedSentence $element";
        }
        if (orderedSentence.contains(state.originalSentence)) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Yay: Your string is correct"),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Uh oh: Your string is incorrect"),
          ));
        }
      },
      child: const Text("Check"),
    );
  }
}
