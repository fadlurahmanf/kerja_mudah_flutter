import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextStyle{
  AppTextStyle._();

  static TextStyle body24({
    double? size = 24, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration, double? height
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration, height: height);
  }

  static TextStyle body22({
    double? size = 22, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration, double? height
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration, height: height);
  }

  static TextStyle body20({
    double? size = 20, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration, double? height
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration, height: height);
  }

  static TextStyle body16({
    double? size = 16, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration, double? height
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration, height: height);
  }

  static TextStyle body14({
    double? size = 14, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration);
  }

  static TextStyle body12({
    double? size = 12, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration);
  }

  static TextStyle body10({
    double? size = 10, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration);
  }

  static TextStyle body8({
    double? size = 8, FontStyle? fontStyle = FontStyle.normal, Color? color = Colors.black, FontWeight? fontWeight = FontWeight.normal,
    TextDecoration? textDecoration
  }){
    return TextStyle(fontFamily: 'Notosans', fontSize: size?.sp, fontStyle: fontStyle, color: color,fontWeight: fontWeight, decoration: textDecoration);
  }
}