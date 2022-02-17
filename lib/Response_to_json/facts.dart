import 'package:flutter/material.dart';

class FeedbackForm{
  String sr;
  String name;

  FeedbackForm(this.sr, this.name);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Sr']}",
      "${json['Name']}",
    );
  }

  Map toJson() => {
    "Sr": sr,
    "Name": name,
  };

}