import 'package:flutter/material.dart';

import '../../../../../core/resources/app_rheme_data.dart';
import '../../../../../core/resources/responive.dart';

class CustomCryptoCurrencyItem extends StatelessWidget {
  const CustomCryptoCurrencyItem({
    super.key,
    required this.symbol,
    required this.name,
    required this.price,
    required this.volume,
    required this.status,
    required this.volumeSpike,
    required this.volumeSpikeRatio,
  });

  final String symbol;
  final String name;
  final double price;
  final double volume;
  final String status;
  final bool volumeSpike;
  final double volumeSpikeRatio;
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
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 55,
                    decoration: BoxDecoration(
                      color: AppThemData.primaryColorBright,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        symbol,
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
                        name,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: AppThemData.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "$volume",
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: AppThemData.assetColorGrey400,
                            ),
                          ),
                          SizedBox(width: 10),

                          Row(
                            children: [
                              Icon(
                                volumeSpike
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: volumeSpike
                                    ? AppThemData.semanticColorSuccess07
                                    : AppThemData.semanticColorError08,
                              ),
                              Text(
                                "${(volumeSpikeRatio * 100).toStringAsFixed(2)}%",
                                style: theme.textTheme.labelSmall!.copyWith(
                                  color: volumeSpike
                                      ? AppThemData.semanticColorSuccess07
                                      : AppThemData.semanticColorError08,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  status,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppThemData.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "$price",
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
