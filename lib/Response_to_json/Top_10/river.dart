import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String sr;
  String river;
  String length;
  String total;

  FeedbackForm(this.pic, this.sr, this.river, this.length, this.total);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Sr']}",
      "${json['River']}",
      "${json['Length']}",
      "${json['Total']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Sr": sr,
    "River": river,
    "Length": length,
    "Total": total,
  };

}