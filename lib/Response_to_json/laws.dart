import 'package:flutter/material.dart';

class FeedbackForm{
  String sr;
  String name;
  String laws;

  FeedbackForm(this.sr, this.name, this.laws);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Sr']}",
      "${json['Name']}",
      "${json['Laws']}",
    );
  }

  Map toJson() => {
    "Sr": sr,
    "Name": name,
    "Laws": laws,
  };

}