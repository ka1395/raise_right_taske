import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/app_rheme_data.dart';
import '../../../../../core/resources/responive.dart';

class CustomCryptoCurrencyItem extends StatelessWidget {
  const CustomCryptoCurrencyItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      width: Responsive.width(100, context),
      decoration: BoxDecoration(
        color: AppThemData.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppThemData.primaryColorBright,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "BTC",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: AppThemData.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bitcoin",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: AppThemData.white,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "\$40,000",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: AppThemData.assetColorGrey400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              width: constraints.maxWidth * .35,
              "assets/icons/green-rate.svg",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "5",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppThemData.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "\$41550,000",
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: AppThemData.assetColorGrey400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
