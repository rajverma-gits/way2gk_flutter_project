import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String name;
  String capital;
  String founded;

  FeedbackForm(this.pic, this.name, this.capital, this.founded);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Name']}",
      "${json['Capital']}",
        "${json['Founded']}"
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Name": name,
    "Capital": capital,
    "Founded": founded
  };

}