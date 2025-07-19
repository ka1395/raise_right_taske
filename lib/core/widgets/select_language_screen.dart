import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../constantd.dart';
import '../resources/app_rheme_data.dart';
import '../resources/get_it.dart';
import '../resources/responive.dart';
import '../utils/app_cubit/app_cubit.dart';
import '../utils/app_cubit/app_states.dart';

class SelectedLanguageScreen extends StatelessWidget {
  const SelectedLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 3,
                width: Responsive.width(25, context),
                decoration: BoxDecoration(
                  color: AppThemData.assetColorGrey300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                flex: 24,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      "قم باختيار اللغة",
                      style: theme.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    languageItemContainer(
                      context,
                      language: Constant.arabicLanguage,
                      flag: "assets/icons/egyptFlag.svg",
                    ),
                    languageItemContainer(
                      context,
                      language: Constant.englishLanguage,
                      flag: "assets/icons/americaFlag.svg",
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  buttonBottomSheet(
                    txt: "الغاء",
                    color: AppThemData.assetColorLightGrey700,
                    textColor: AppThemData.assetColorDarkGrey950,
                    func: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 24),
                  buttonBottomSheet(
                    txt: "تغيير",
                    color: AppThemData.primaryColor,
                    textColor: AppThemData.white,
                    func: () {
                      // ProfileCubit.get(context).setAppLanguage();
                      if (instanceGetIt.get<AppCubit>().selectLanguage ==
                          Constant.englishLanguage) {
                        instanceGetIt.get<AppCubit>().currentLanguage =
                            Constant.englishLanguageCode;
                      } else if (instanceGetIt.get<AppCubit>().selectLanguage ==
                          Constant.arabicLanguage) {
                        instanceGetIt.get<AppCubit>().currentLanguage =
                            Constant.arabicLanguageCode;
                      } else {
                        instanceGetIt.get<AppCubit>().currentLanguage =
                            Constant.arabicLanguageCode;
                      }
                      Navigator.pop(context);
                      // ShowToastDialog.showToast(
                      //   instanceGetIt.get<AppCubit>().selectLanguage ==
                      //           Constant.englishLanguage
                      //       ? "language changed to English"
                      //       : "تم تغيير اللغة الي العربية",
                      //   position: EasyLoadingToastPosition.bottom,
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Expanded buttonBottomSheet({
    required String txt,
    required Color color,
    required Color textColor,
    required void Function()? func,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: func,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Text(
            txt,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector languageItemContainer(
    context, {
    required String language,
    required String flag,
  }) {
    return GestureDetector(
      onTap: () {
        instanceGetIt.get<AppCubit>().selectLanguageFun(language);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          height: 64,
          padding: const EdgeInsets.all(10),
          decoration: instanceGetIt.get<AppCubit>().selectLanguage == language
              ? BoxDecoration(
                  border: Border.all(
                    color: AppThemData.secondaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: AppThemData.secondaryColor.withValues(alpha: .3),
                )
              : BoxDecoration(
                  border: Border.all(
                    color: AppThemData.assetColorLightGrey700,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
          child: Row(
            children: [
              SvgPicture.asset(flag),
              const SizedBox(width: 6),
              Text(language, style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              instanceGetIt.get<AppCubit>().selectLanguage == language
                  ? selectedIcon()
                  : unSelectedIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Container unSelectedIcon() {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppThemData.assetColorLightGrey700, width: 2),
      ),
    );
  }

  Container selectedIcon() {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppThemData.secondaryColor,
      ),
      child: const Icon(Icons.check, size: 16, color: AppThemData.white),
    );
  }
}
