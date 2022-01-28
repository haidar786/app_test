import 'package:app_test/components/home/next_button.dart';
import 'package:app_test/components/home/sentence_input.dart';
import 'package:app_test/model/sentence_form_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final sentenceFormModel = SentenceFormModel();
  final sentenceFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: sentenceFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomePageSentenceTextField(sentenceFormModel: sentenceFormModel),
          const SizedBox(height: 30),
          HomePageNextButton(
              sentenceFormModel: sentenceFormModel, formKey: sentenceFormKey),
        ],
      ),
    ));
  }
}
