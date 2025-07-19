
import 'package:flutter/material.dart';

import 'custom_crypto_currency_item.dart';

class CustomCryptoCurrencyLoadingSkeletonList extends StatelessWidget {
  const CustomCryptoCurrencyLoadingSkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        // Create dummy data for skeleton
        return CustomCryptoCurrencyItem(
          symbol: "demo",
          name: "demo",
          price: 50000.00,
          volume: 1000000.00,
          status: "demo",
          volumeSpike: false,
          volumeSpikeRatio: 1.0,
        );
      },
    );
  }
}
