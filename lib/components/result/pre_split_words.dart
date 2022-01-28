import 'package:app_test/bloc/result/shuffle/shuffle_bloc.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_state.dart';
import 'package:app_test/model/drag_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPagePreSplitWordsList extends StatelessWidget {
  const ResultPagePreSplitWordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShuffleBloc, ShuffleBlocState>(
      builder: (BuildContext context, state) {
        return Center(
          child: Wrap(
            spacing: 20.0,
            children: List.generate(
                state.randomList.length,
                (index) => Draggable(
                      data: DragData(
                          index: index,
                          text: state.randomList[index],
                          isSwap: false),
                      feedback: Material(
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green.shade50,
                                border: Border.all()),
                            child: Text(state.randomList[index])),
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade50,
                              border: Border.all()),
                          child: Text(state.randomList[index])),
                      childWhenDragging: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red.shade50,
                            border: Border.all()),
                        child: Visibility(
                          visible: false,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Text(state.randomList[index]),
                        ),
                      ),
                    )),
          ),
        );
      },
    );
  }
}
