import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String title;
  String symbol;

  FeedbackForm(this.pic, this.title, this.symbol);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Title']}",
      "${json['Symbol']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Title": title,
    "Symbol": symbol,
  };

}