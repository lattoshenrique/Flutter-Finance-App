import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'appcolors.style.dart';

class AppTheme {
  static get themeData => ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColors.PRIMARY,

        visualDensity: VisualDensity.adaptivePlatformDensity,

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: AppColors.PRIMARY),

        //Define the default input theme
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: AppColors.GRAY42),
        ),

        //Define the default appbar theme
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: AppColors.PRIMARY,
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        //Define the default card theme
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 8,
          shadowColor: AppColors.SHADOW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: const BorderSide(color: Color(0xFFE6E6E6)),
          ),
        ),

        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        scaffoldBackgroundColor: Colors.white,
        // unselectedWidgetColor: AppColors.GRAYDA,
        // toggleableActiveColor: AppColors.PRIMARY,

        // Define the default font family.
        fontFamily: 'Muli',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800, color: AppColors.PRIMARY),
          headline2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),
          headline3: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: AppColors.GRAY42),
          subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColors.GRAY7E),
          subtitle2: TextStyle(fontSize: 19.0, color: AppColors.PRIMARY),
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black),
          bodyText2: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          caption: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      );
}
