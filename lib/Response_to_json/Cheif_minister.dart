import 'package:flutter/material.dart';

class FeedbackForm{
  String profilePic;
  String name;
  String state;

  FeedbackForm(this.profilePic, this.name, this.state);

  factory FeedbackForm.fromJson(dynamic json){
    return FeedbackForm(
      "${json['Profile Pic']}",
      "${json['Name']}",
      "${json['State']}",
    );
  }

  Map toJson() => {
    "Profile Pic": profilePic,
    "Name": name,
    "State": state,
  };
  
}