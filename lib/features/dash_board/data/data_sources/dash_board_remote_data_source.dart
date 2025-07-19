import 'dart:async';
import 'dart:convert';
import 'package:raise_right_taske/features/dash_board/data/mapper/tricker_mapper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../core/constantd.dart';
import '../../../../core/network/dio.dart';
import '../../domain/entitys/coins_entity.dart';
import '../models/ticker_model.dart';

abstract class DashBoardRemoteDataSource {
  Future<Map<String, CoinsEntity>> fetchInitialCoins();
  Future<void> subscribeToTickerCoinsUpdates({
    void Function(CoinsEntity)? onCoinsReceived,
  });
  Future<void> closeWebSocket();
}

class DashBoardRemoteDataSourceImp extends DashBoardRemoteDataSource {
  WebSocketChannel? channel;
  @override
  Future<Map<String, CoinsEntity>> fetchInitialCoins() async {
    var response = await DioHelper.get(
      url: EndPoint.fetchCoins,
      query: {"instType": "SPOT"},
    );

    Map<String, CoinsEntity> coinsList = {};

    if (response.data['code'] == '0') {
      List tickers = response.data['data'];
      Map<String, dynamic> coinMap = {};

      // Create a map of symbol to ticker data
      for (var ticker in tickers) {
        coinMap[ticker['instId']] = ticker;
      }

      TickerModel.requiredCoins.map((symbol) {
        if (coinMap[symbol] != null) {
          coinsList.addEntries(
            {
              symbol.split('-')[0]: TickerModel.fromJson(
                coinMap[symbol],
              ).toDomain(),
            }.entries,
          );
        } else {
          // If the coin is not found, create a default entry
          coinsList.addEntries(
            {
              symbol: CoinsEntity(
                status: 'delisted',
                volumeSpike: false,
                symbol: symbol.split('-')[0],
                name: TickerModelExtension.getCoinName(symbol.split('-')[0]),
                price: 0.0,
                volume: 0.0,
                volumeSpikeRatio: 0.0,
              ),
            }.entries,
          );
        }
      }).toList();
    }
    return coinsList;
  }

  @override
  Future<void> subscribeToTickerCoinsUpdates({
    void Function(CoinsEntity)? onCoinsReceived,
  }) async {
    channel = WebSocketChannel.connect(Uri.parse(Constant.wsUrl));

    await channel!.ready;

    final subscriptions = {
      'op': 'subscribe',
      'args': TickerModel.requiredCoins.map((symbol) {
        return {'channel': 'tickers', 'instId': symbol};
      }).toList(),
    };

    channel!.sink.add(jsonEncode(subscriptions));

    channel!.stream.listen((event) {
      final decoded = jsonDecode(event);
      if (decoded is Map && decoded.containsKey('event')) {
        // Handle subscription ack or error events if needed
        return;
      }
      if (decoded['arg'] == null || decoded['data'] == null) return;
      if (decoded['arg']['channel'] == 'tickers') {
        final Map<String, dynamic> response = decoded['data'][0];
        final ticker = TickerModel.fromJson(response);
        final coinEntity = ticker.toDomain();
        onCoinsReceived!(coinEntity);
      }
    });
  }

  @override
  Future<void> closeWebSocket() async {
    if (channel != null) {
      await channel!.sink.close();
      channel = null;
    }
  }
}
