import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String state;
  String capital;

  FeedbackForm(this.pic, this.state, this.capital);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['State']}",
      "${json['Capitals']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "State": state,
    "Capitals": capital,
  };

}