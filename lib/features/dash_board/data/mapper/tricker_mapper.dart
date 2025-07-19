import '../../domain/entitys/coins_entity.dart';
import '../models/ticker_model.dart';

extension TickerModelExtension on TickerModel? {
  static String getCoinName(String symbol) {
    const names = <String, String>{
      'BTC': 'Bitcoin',
      'ETH': 'Ethereum',
      'XRP': 'Ripple',
      'BNB': 'Binance Chain',
      'SOL': 'Solana',
      'DOGE': 'Dogecoin',
      'TRX': 'Tron Network',
      'ADA': 'Cardano',
      'HYPE': 'Hyperliquid',
      'XLM': 'Stellar',
    };
    return names[symbol] ?? '';
  }

  CoinsEntity toDomain() {
    final symbol = this?.instId?.split('-')[0] ?? '';

    // Parse prices once and format to 2 decimal places
    final priceValue = double.tryParse(this?.last ?? "0.0") ?? 0.0;
    final volumeValue = double.tryParse(this?.vol24h ?? "0.0") ?? 0.0;

    final formattedPrice = double.parse(priceValue.toStringAsFixed(2));
    final formattedVolume = double.parse(volumeValue.toStringAsFixed(2));

    // // Calculate spike and ratio efficiently
    // final volumeSpike = formattedVolume >= (formattedPrice * 1.5);
    // final volumeSpikeRatio = formattedPrice > 0
    //     ? formattedVolume / formattedPrice
    //     : 0.0;

    return CoinsEntity(
      symbol: symbol,
      name: getCoinName(symbol),
      price: formattedPrice,
      volume: formattedVolume,
      status: 'listed',
      volumeSpike: false,
      volumeSpikeRatio: 0.0,
    );
  }
}
