import 'package:flutter/material.dart';
import 'package:chat_app/  helper/india_first_size.dart';

const kPrimaryColors = Color(0xFFFF7643);
const kPrimaryLightColors = Color(0xFFFFECDF);
const kPrimaryGradientColors = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColors = Color(0xFF979797);
const kTextColors = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);