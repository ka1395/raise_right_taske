import 'package:flutter/material.dart';

import '../../../domain/entitys/coins_entity.dart';
import 'custom_crypto_currency_item.dart';

class CoinsListView extends StatelessWidget {
  const CoinsListView({super.key, required this.coinsList});

  final List<CoinsEntity> coinsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coinsList.length, // Show 10 skeleton items while loading
      itemBuilder: (context, index) {
        final coinsItem = coinsList[index];
        return CustomCryptoCurrencyItem(
          symbol: coinsItem.symbol,
          name: coinsItem.name,
          price: coinsItem.price,
          volume: coinsItem.volume,
          status: coinsItem.status,
          volumeSpike: coinsItem.volumeSpike,
          volumeSpikeRatio: coinsItem.volumeSpikeRatio,
        );
      },
    );
  }
}
