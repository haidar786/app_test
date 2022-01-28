import 'package:app_test/model/sentence_form_model.dart';
import 'package:app_test/pages/Result/result.dart';
import 'package:flutter/material.dart';

class HomePageNextButton extends StatelessWidget {
  const HomePageNextButton(
      {Key? key, required this.sentenceFormModel, required this.formKey})
      : super(key: key);
  final SentenceFormModel sentenceFormModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Next"),
      onPressed: () {
        final formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          formState.save();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultPage(sentence: sentenceFormModel.sentence)));
        }
      },
    );
  }
}
