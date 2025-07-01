import 'package:flutter/material.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:timelines_plus/timelines_plus.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppPalette.whitePrimary,
    //App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalette.whitePrimary,
      foregroundColor: AppPalette.black,
      titleTextStyle: TextStyles.sf60020,
    ),

    // radioTheme: RadioThemeData(
    //   fillColor: WidgetStateProperty.resolveWith<Color>(
    //   )
    // ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: AppPalette.whiteLight2,
    //   selectedItemColor: AppPalette.blueColor,
    //   unselectedItemColor: AppPalette.blueColor,

    // ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: AppPalette.whiteLight2,
    //   selectedItemColor: AppPalette.blueColor,
    //   unselectedItemColor: AppPalette.blueColor,
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: AppPalette.lightPurple,
    //   foregroundColor: AppPalette.whiteColor,
    //   shape: CircleBorder(),
    //   iconSize: 32,
    //   sizeConstraints: BoxConstraints(minWidth: 64, minHeight: 64),
    // ),
    //Elevated Button Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.whitePrimary,

      // hintStyle: TextStyles.sepro30012,
      focusedBorder: _border(AppPalette.grayPrimary),
      hintStyle: TextStyles.sf70012,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.iosRed),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.iosRed),
      ),
      enabledBorder: _border(AppPalette.grayPrimary),
    ),

    //Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(1, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(padding: EdgeInsets.zero),
    ),
  );
  static TimelineThemeData timelineTheme = TimelineThemeData(
    // 1) وضع المحور في اليمين
    nodePosition: 1.0,

    // 2) ضبط لون وشكل الموصلات
    connectorTheme: const ConnectorThemeData(
      color: AppPalette.bluePrimary, 
      thickness: 3,
      // space: 10,
    ),

    // 3) ضبط لون وحجم المؤشرات (النقاط)
    indicatorTheme: const IndicatorThemeData(
      color: AppPalette.bluePrimary,
      size: 22.0,
    ),
  );

  //Outline Input Border Method
  // static OutlineInputBorder _border(Color borderColor) {
  //   return OutlineInputBorder(
  //     borderSide: BorderSide(color: AppPalette.lightGray2, width: 0.8),
  //   );
  // }
  static OutlineInputBorder _border(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppPalette.black, width: 0.8),
    );
  }
}
