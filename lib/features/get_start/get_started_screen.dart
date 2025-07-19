import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raise_right_taske/core/resources/app_rheme_data.dart';
import '../../core/resources/routs.dart';
import '../../core/widgets/round_button_fill.dart';
import '../../generated/l10n.dart'; // Import the generated localization class

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = S.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pubbels_icon.svg',
                      fit: BoxFit.fill,
                    ),
                    SvgPicture.asset(
                      'assets/icons/security.svg',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Text(
                  localization.save_security,
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 15),
                Text(
                  localization.des_intro_screen,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
            RoundedButtonFill(
              title: localization.get_started, // Use the localized string
              fontSizes: 18,
              color: AppThemData.primaryColor,
              onPress: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouts.dashboardScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
