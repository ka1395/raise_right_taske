import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio.dart';
import 'core/network/hive.dart';
import 'core/network/preferences.dart';
import 'core/resources/my_block_observer.dart';
import 'core/resources/routs.dart';
import 'core/resources/theme_app.dart';
import 'package:device_preview/device_preview.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await HiveHelper.init();
  await Preferences.initPref();
  await DioHelper.init();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppRouts.getStartedScreen,
      theme: darkTheme(),
      // instanceGetIt.get<AppCubit>().getThem()
      // ? darkTheme()
      // : lightTheme(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
