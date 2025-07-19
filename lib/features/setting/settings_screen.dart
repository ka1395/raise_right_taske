import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/network/preferences.dart';
import '../../../../core/utils/app_cubit/app_cubit.dart';
import '../../core/resources/app_rheme_data.dart';
import '../../core/resources/get_it.dart';
import '../../core/utils/app_cubit/app_states.dart';
import '../../core/widgets/select_language_screen.dart';
import '../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = instanceGetIt.get<AppCubit>();
    final theme = Theme.of(context);
    final localization = S.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,

        title: Text(
          localization.settings,
          textAlign: TextAlign.start,
          style: theme.textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: themeChange.getThem()
                        ? AppThemData.primaryColor
                        : AppThemData.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),

                      ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: themeChange.getThem()
                                ? AppThemData.primaryColorBright
                                : AppThemData.white,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return const SelectedLanguageScreen();
                            },
                          );
                        },
                        leading: SvgPicture.asset(
                          "assets/icons/ic_translate.svg",
                          colorFilter: const ColorFilter.mode(
                            AppThemData.assetColorLightGrey1000,
                            BlendMode.srcIn,
                          ),
                        ),
                        horizontalTitleGap: 3,
                        title: Text(
                          localization.language,
                          style: theme.textTheme.titleLarge,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: AppThemData.assetColorLightGrey1000,
                        ),
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -2),
                        leading: SvgPicture.asset(
                          "assets/icons/ic_moon.svg",
                          colorFilter: const ColorFilter.mode(
                            AppThemData.assetColorLightGrey1000,
                            BlendMode.srcIn,
                          ),
                        ),
                        horizontalTitleGap: 3,
                        title: Text(
                          localization.dark_mode,
                          style: theme.textTheme.titleLarge,
                        ),
                        trailing: Transform.scale(
                          scale: 0.7,
                          child: BlocBuilder<AppCubit, AppStates>(
                            builder: (context, state) {
                              return CupertinoSwitch(
                                activeTrackColor: AppThemData.secondaryColor,
                                thumbColor: AppThemData.white,
                                value: themeChange.darkTheme,
                                onChanged: (value) {
                                  themeChange.darkTheme = value;
                                  Preferences.setBoolean(
                                    Preferences.themeKey,
                                    value,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
