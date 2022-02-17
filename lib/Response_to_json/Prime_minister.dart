import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String name;
  String period;

  FeedbackForm(this.pic, this.name, this.period);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Name']}",
      "${json['Period']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Name": name,
    "Period": period,
  };

}