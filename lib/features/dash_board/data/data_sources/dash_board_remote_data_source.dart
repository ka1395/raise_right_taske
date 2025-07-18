import 'package:raise_right_taske/features/dash_board/data/mapper/tricker_mapper.dart';

import '../../../../core/constantd.dart';
import '../../../../core/network/dio.dart';
import '../../domain/entitys/coins_entity.dart';
import '../models/ticker_model.dart';

abstract class DashBoardRemoteDataSource {
  Future<List<CoinsEntity>> fetchInitialCoins();
}

class DashBoardRemoteDataSourceImp extends DashBoardRemoteDataSource {
  @override
  Future<List<CoinsEntity>> fetchInitialCoins() async {
    var response = await DioHelper.get(
      url: EndPoint.fetchCoins,
      query: {"instType": "SPOT"},
    );

    List<CoinsEntity> coinsList = [];

    if (response.data['code'] == '0') {
      List tickers = response.data['data'];
      Map<String, dynamic> coinMap = {};

      // Create a map of symbol to ticker data
      for (var ticker in tickers) {
        coinMap[ticker['instId']] = ticker;
      }

      TickerModel.requiredCoins.map((symbol) {
        if (coinMap[symbol] != null) {
          coinsList.add(TickerModel.fromJson(coinMap[symbol]).toDomain());
        } else {
          // If the coin is not found, create a default entry
          coinsList.add(
            CoinsEntity(
              status: 'delisted',
              volumeSpike: false,
              symbol: symbol.split('-')[0],
              name: TickerModelExtension.getCoinName(symbol.split('-')[0]),
              price: 0.0,
              volume: 0.0,
              volumeSpikeRatio: 0.0,
            ),
          );
        }
      }).toList();
    }
    return coinsList;
  }
}
