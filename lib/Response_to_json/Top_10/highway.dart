import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String sr;
  String nh;
  String distance;
  String route;

  FeedbackForm(this.pic, this.sr, this.nh, this.distance, this.route);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Sr']}",
      "${json['NH']}",
      "${json['Distance']}",
      "${json['Route']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Sr": sr,
    "NH": nh,
    "Distance": distance,
    "Route": route,
  };

}