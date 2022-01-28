import 'package:app_test/model/sentence_form_model.dart';
import 'package:flutter/material.dart';

class HomePageSentenceTextField extends StatelessWidget {
  const HomePageSentenceTextField({Key? key, required this.sentenceFormModel})
      : super(key: key);
  final SentenceFormModel sentenceFormModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (text) {
        if (text != null) {
          sentenceFormModel.sentence = text;
        }
      },
      validator: (text) {
        if (text == null || text == "") {
          return "Please enter sentence";
        }
        return null;
      },
    );
  }
}
