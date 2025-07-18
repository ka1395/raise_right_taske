import 'package:flutter/material.dart';
import 'app_rheme_data.dart';
import 'style.dart';

// to access the themeData properties use {Theme.of(context).}
ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppThemData.primaryColor,
    scaffoldBackgroundColor: AppThemData.assetColorLightGrey400,
    disabledColor: AppThemData.disabledColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppThemData.assetColorLightGrey400,
      titleTextStyle: TextStyle(color: AppThemData.assetColorLightGrey1000),
      iconTheme: IconThemeData(color: AppThemData.assetColorLightGrey1000),
    ),
    textTheme: TextTheme(
      headlineLarge: black24bold(),
      headlineMedium: black22bold(),
      headlineSmall: black20bold(),
      titleLarge: black18regular(),
      titleMedium: black16regular(),
      titleSmall: black14regular(),
      labelSmall: black12regular(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppThemData.assetColorLightGrey400,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: AppThemData.white,
      unselectedItemColor: AppThemData.assetColorLightGrey1000,
      selectedItemColor: AppThemData.primaryColor,
      selectedIconTheme: IconThemeData(color: AppThemData.primaryColor),
      unselectedIconTheme: IconThemeData(
        color: AppThemData.assetColorLightGrey1000,
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppThemData.assetColorLightGrey1000,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.colorRed, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    iconTheme: const IconThemeData(color: AppThemData.assetColorDarkGrey950),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    disabledColor: AppThemData.disabledColor,
    primaryColor: AppThemData.primaryColor,
    scaffoldBackgroundColor: AppThemData.assetColorGrey1000,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      // color: AppThemData.primaryColorDark,
      titleTextStyle: TextStyle(color: AppThemData.assetColorLightGrey600),
      backgroundColor: AppThemData.assetColorGrey1000,
      elevation: 0,
      iconTheme: IconThemeData(color: AppThemData.white),
    ),
    textTheme: TextTheme(
      headlineLarge: white24bold(),
      headlineMedium: white22bold(),
      headlineSmall: white20bold(),
      titleLarge: white18regular(),
      titleMedium: white16regular(),
      titleSmall: white14regular(),
      labelSmall: white12regular(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppThemData.assetColorGrey1000,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppThemData.assetColorLightGrey1000,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.colorRed, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppThemData.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: AppThemData.assetColorGrey1000,
      unselectedItemColor: AppThemData.assetColorLightGrey1000,
      selectedItemColor: AppThemData.primaryColor,
      selectedIconTheme: IconThemeData(color: AppThemData.primaryColor),
      unselectedIconTheme: IconThemeData(
        color: AppThemData.assetColorLightGrey1000,
      ),
    ),
    iconTheme: const IconThemeData(color: AppThemData.white),
  );
}
