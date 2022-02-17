import 'package:flutter/material.dart';

class FeedbackForm{
  String sr;
  String question;
  String answer;

  FeedbackForm(this.sr, this.question, this.answer);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Sr']}",
      "${json['Question']}",
      "${json['Answer']}",
    );
  }

  Map toJson() => {
    "Sr": sr,
    "Question": question,
    "Answer": answer,
  };

}