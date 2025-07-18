class TickerModel {
  static List<String> requiredCoins = const [
    'BTC-USDT',
    'ETH-USDT',
    'XRP-USDT',
    'BNB-USDT',
    'SOL-USDT',
    'DOGE-USDT',
    'TRX-USDT',
    'ADA-USDT',
    'HYPE-USDT',
    'XLM-USDT',
  ];
  // static String getCoinName(String symbol) {
  //   const names = <String, String>{
  //     'BTC': 'Bitcoin',
  //     'ETH': 'Ethereum',
  //     'XRP': 'Ripple',
  //     'BNB': 'Binance Chain',
  //     'SOL': 'Solana',
  //     'DOGE': 'Dogecoin',
  //     'TRX': 'Tron Network',
  //     'ADA': 'Cardano',
  //     'HYPE': 'Hyperliquid',
  //     'XLM': 'Stellar',
  //   };
  //   return names[symbol] ?? '';
  // }

  String? instType;
  String? instId;
  String? last;
  String? lastSz;
  String? askPx;
  String? askSz;
  String? bidPx;
  String? bidSz;
  String? open24h;
  String? high24h;
  String? low24h;
  String? volCcy24h;
  String? vol24h;
  String? ts;
  String? sodUtc0;
  String? sodUtc8;

  TickerModel({
    this.instType,
    this.instId,
    this.last,
    this.lastSz,
    this.askPx,
    this.askSz,
    this.bidPx,
    this.bidSz,
    this.open24h,
    this.high24h,
    this.low24h,
    this.volCcy24h,
    this.vol24h,
    this.ts,
    this.sodUtc0,
    this.sodUtc8,
  });
  // : super(
  //        name: getCoinName(instId ?? ''),
  //        price: last ?? 0.0,
  //        status: 'listed',
  //        symbol: instId ?? '',
  //        volume: vol24h ?? 0.0,
  //        volumeSpike: (vol24h! >= last! * 1.5) ? true : false,
  //      );

  factory TickerModel.fromJson(Map<String, dynamic> json) {
    // final baseSymbol = json['instId']?.split('-')[0] ?? '';
    return TickerModel(
      instType: json['instType'] as String?,
      instId: json['instId'] as String?,
      last: json['last'] as String?,

      //  double.tryParse(
      //   double.parse(json['last'] ?? "0.0").toStringAsFixed(2),
      // ),
      //  double.tryParse(
      //   double.parse(json['vol24h'] ?? "0.0").toStringAsFixed(2),
      // ),
      lastSz: json['lastSz'] as String?,
      askPx: json['askPx'] as String?,
      askSz: json['askSz'] as String?,
      bidPx: json['bidPx'] as String?,
      bidSz: json['bidSz'] as String?,
      open24h: json['open24h'] as String?,
      high24h: json['high24h'] as String?,
      low24h: json['low24h'] as String?,
      volCcy24h: json['volCcy24h'] as String?,
      vol24h: json['vol24h'] as String?,
      ts: json['ts'] as String?,
      sodUtc0: json['sodUtc0'] as String?,
      sodUtc8: json['sodUtc8'] as String?,
    );
  }
  Map<String, dynamic> toJson() => {
    'instType': instType,
    'instId': instId,
    'last': last,
    'lastSz': lastSz,
    'askPx': askPx,
    'askSz': askSz,
    'bidPx': bidPx,
    'bidSz': bidSz,
    'open24h': open24h,
    'high24h': high24h,
    'low24h': low24h,
    'volCcy24h': volCcy24h,
    'vol24h': vol24h,
    'ts': ts,
    'sodUtc0': sodUtc0,
    'sodUtc8': sodUtc8,
  };
}
