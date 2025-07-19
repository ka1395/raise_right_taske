import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constantd.dart';
import '../../network/preferences.dart';
import '../dark_theme_preference.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = true;
  String _currentLanguage = Constant.englishLanguageCode;
  String selectLanguage = Constant.englishLanguage;
  bool get darkTheme => _darkTheme;
  String get currentLanguage {
    if (_currentLanguage.isEmpty) {
      return Constant.englishLanguageCode;
    } else {
      return _currentLanguage;
    }
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    emit(ChangeDarkThemeState());
  }

  bool getThem() {
    return darkTheme;
  }

  bool getSystemThem() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  String getLanguage() {
    currentLanguage = Preferences.getString(Preferences.languageKey);
    // if (currentLanguage == Constant.arabicLanguageCode) {
    //   selectLanguage = Constant.arabicLanguage;
    // } else {
    //   selectLanguage = Constant.englishLanguage;
    // }
    return currentLanguage;
  }

  void selectLanguageFun(String value) {
    selectLanguage = value;

    emit(SelecLanguageState());
  }

  set currentLanguage(String value) {
    _currentLanguage = value;
    Preferences.setString(Preferences.languageKey, value);
    selectLanguage = value == Constant.englishLanguageCode
        ? Constant.englishLanguage
        : Constant.arabicLanguage;
    emit(ChangeLanguageState());
  }
}
