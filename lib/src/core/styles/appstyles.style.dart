// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  //
  //TextTheme
  //
  // HEADS
  static TextStyle get head1 => Get.context!.textTheme.headline1!;
  static TextStyle get head2 => Get.context!.textTheme.headline2!;
  static TextStyle get head3 => Get.context!.textTheme.headline3!;
  //SUBTITLES
  static TextStyle get subtitle1 => Get.context!.textTheme.subtitle1!;
  static TextStyle get subtitle2 => Get.context!.textTheme.subtitle2!;
  //BODYS
  static TextStyle get body1 => Get.context!.textTheme.bodyText1!;
  static TextStyle get body2 => Get.context!.textTheme.bodyText2!;
  static TextStyle get body3 => Get.context!.textTheme.bodyText1!.copyWith(fontSize: 13);
  static TextStyle get body4 => Get.context!.textTheme.bodyText2!.copyWith(fontSize: 13);
  //CAPTIONS
  static TextStyle get caption1 => Get.context!.textTheme.caption!;
  static TextStyle get caption2 => Get.context!.textTheme.caption!.copyWith(fontWeight: FontWeight.bold);
  //VALUES
  static TextStyle get value1 => Get.context!.textTheme.caption!.copyWith(fontSize: 29);
  static TextStyle get value2 => Get.context!.textTheme.subtitle1!;

  //
  // General
  //
  static const INPUT_PADDING = EdgeInsets.symmetric(horizontal: 10, vertical: 14);
}
