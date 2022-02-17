// @dart=2.9

import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    title: Center(child: Image.asset("assets/Images/logo.png",height: 50,),),
  );
}

InputDecoration textFieldDecoration(String hintText)
{
  return InputDecoration(
    hintText: "$hintText",
    hintStyle: TextStyle(
      color: Colors.black54,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}

TextStyle simpleTextStyle()
{
  return  TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
}


const kBlackColor = Color(0xFF393939);
const kLightBlackColor = Color(0xFF8F8F8F);
const kIconColor = Color(0xFFF48A37);
const kProgressIndicator = Color(0xFFBE7066);

final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);

TextStyle mediumTextStyle()
{
  return TextStyle(
    color: Colors.black,
    fontSize: 17,
  );
}

Widget addVerticalSpace(double height){
  return SizedBox(
      height:height
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
      width:width
  );
}