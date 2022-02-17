import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String name;
  String capital;
  String language;
  String currency;

  FeedbackForm(this.pic, this.name, this.capital, this.language, this.currency);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Name']}",
      "${json['Capital']}",
      "${json['Language']}",
      "${json['Currency']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Name": name,
    "Capital": capital,
    "Language": language,
    "Currency": currency,
  };

}