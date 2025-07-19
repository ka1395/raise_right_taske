import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/dash_board/presentation/veiw_model/dashboard_cubit/dashboard_cubit.dart';
import '../../features/get_start/get_started_screen.dart';
import '../../features/dash_board/presentation/view/dash_board_creen.dart';
import '../../features/setting/settings_screen.dart';
import '../widgets/round_button_fill.dart';
import 'app_rheme_data.dart';
import 'get_it.dart';
import 'responive.dart';

class AppRouts {
  static const String getStartedScreen = "/";
  static const String dashboardScreen = "/DashboardScreen";
  static const String settingsScreen = "/SettingsScreen";

  
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final routes = <String, Widget>{
    AppRouts.dashboardScreen: BlocProvider(
      create: (context) {
        return instanceGetIt<DashboardCubit>()..fetchInitialCoins();
      },
      child: const DashboardScreen(),
    ),
    AppRouts.getStartedScreen: const GetStartedScreen(),
    AppRouts.settingsScreen: const SettingsScreen(),

  };

  final builder = routes[settings.name];
  if (builder != null) {
    return animationRout(builder);
  }

  // Default route if no match is found
  return animationRout(const PageNotFound());
}

PageRouteBuilder<dynamic> animationRout(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero),
        ),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("assets/icons/no_results_page.png"),

              height: Responsive.width(30, context),
              width: Responsive.width(30, context),
            ),
            const SizedBox(height: 36),
            Text(
              "الصفحة غير موجودة",
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge,
            ),

            const SizedBox(height: 36),
            RoundedButtonFill(
              title: "رجوع",
              color: AppThemData.primaryColor,
              textColor: AppThemData.white,
              fontFamily: AppThemData.bold,
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
