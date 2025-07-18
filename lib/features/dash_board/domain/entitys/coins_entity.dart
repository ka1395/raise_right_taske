class CoinsEntity {
  final String symbol;
  final String name;
  final double price;
  final double volume;
  final double volumeSpikeRatio;
  
  final String status;
  final bool volumeSpike;

  CoinsEntity({
    required this.symbol,
    required this.name,
    required this.price,
    required this.volume,
    required this.status,
    required this.volumeSpike,
    required this.volumeSpikeRatio,
  });
}
