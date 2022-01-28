import 'package:app_test/bloc/result/order/order_bloc.dart';
import 'package:app_test/bloc/result/shuffle/shuffle_bloc.dart';
import 'package:app_test/components/result/pre_split_words.dart';
import 'package:app_test/components/result/target_split_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.sentence}) : super(key: key);
  final String sentence;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) {
            final splitList = widget.sentence.split(" ");
            splitList.shuffle();
            return ShuffleBloc(splitList);
          }),
          BlocProvider(create: (_) {
            return OrderBloc();
          }),
        ],
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ResultPageTargetSplitWordsList(),
            SizedBox(height: 20.0),
            ResultPagePreSplitWordsList()
          ],
        )));
  }
}
