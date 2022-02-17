import 'package:flutter/material.dart';

class FeedbackForm{
  String pic;
  String sr;
  String name;
  String distance;
  String opened;
  String type;
  String connecting;
  String place;

  FeedbackForm(this.pic, this.sr, this.name, this.distance, this.opened, this.type, this.connecting, this.place);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Pic']}",
      "${json['Sr']}",
      "${json['Name']}",
      "${json['Distance']}",
      "${json['Opened']}",
      "${json['Type']}",
      "${json['Connecting']}",
      "${json['Place']}",
    );
  }

  Map toJson() => {
    "Pic": pic,
    "Sr": sr,
    "Name": name,
    "Distance": distance,
    "Opened": opened,
    "Type": type,
    "Connecting": connecting,
    "Place": place,
  };

}