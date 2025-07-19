import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entitys/coins_entity.dart';
import '../../../domain/use_cases/fetch_initial_data_use_case.dart';
import '../../../domain/use_cases/stream_coins_use_case.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  static DashboardCubit get(context) => BlocProvider.of(context);
  final FetchInitialDataUseCase fetchInitialDataUseCase;
  final StreamCoinsUseCase streamCoinsUseCase;

  String statusConnection = 'connecting';

  DashboardCubit(this.fetchInitialDataUseCase, this.streamCoinsUseCase)
    : super(DashboardInitial());
  Map<String, CoinsEntity> coinsList = {};
  Future<void> fetchInitialCoins() async {
    emit(GetInitCoinsLoadingState());
    final result = await fetchInitialDataUseCase.call();
    result.fold(
      (failure) {
        emit(GetInitCoinsErrorState(failure.meesage));
      },

      (coins) {
        coinsList = coins; // Store the fetched coins in the local list
        emit(GetInitCoinsSuccessState());
      },
    );
  }

  void setupWebSocketListener() async {
    emit(WsConnectingState());
    statusConnection = 'connecting';
    var result = await streamCoinsUseCase.call((coinEntity) {
      coinsList[coinEntity.symbol] = coinEntity;
      emit(WsUpdateState());
    });
    result.fold(
      (failure) {
        statusConnection = 'disconnected';
        emit(WsDisconnectedState());
      },
      (noReturn) {
        statusConnection = 'live';
        emit(WsConnectedState());
      },
    );
  }

  Future<void> closeWebSocket() async {
    await streamCoinsUseCase.closeWebSocket();
    statusConnection = 'disconnected';
    emit(WsDisconnectedState());
  }

  // void _onMessage(dynamic message) {
  //   final decoded = jsonDecode(message);

  //   if (decoded is Map && decoded.containsKey('event')) {
  //     // Handle subscription ack or error events if needed
  //     return;
  //   }

  //   if (decoded['arg'] == null || decoded['data'] == null) return;

  //   final channel = decoded['arg']['channel'];
  //   final instId = decoded['arg']['instId'] ?? "";
  //   if (channel == 'tickers') {
  //     statusConnection = 'live';

  //     final Map<String, dynamic> response = decoded['data'][0];

  //     // Check if response contains ticker data

  //     // Each message typically contains one ticker update
  //     final ticker = TickerModel.fromJson(response);
  //     final coinEntity = ticker.toDomain();
  //     coinsList[coinEntity.symbol] = coinEntity;
  //     emit(WsUpdateState());
  //   }
  // }

  // void _onDisconnected() {
  //   emit(WsDisconnectedState());
  //   statusConnection = 'disconnected';

  //   // _stopPing();

  //   if (!_manuallyClosed) {
  //     _reconnect();
  //   }
  // }

  // void _reconnect() {
  //   emit(WsReconnectingState());
  //   statusConnection = 'Reconnected';

  //   connectWebSocket();
  // }

  // void disconnect() {
  //   _manuallyClosed = true;
  //   _channel.sink.close();
  //   statusConnection = 'disconnected';
  //   emit(WsDisconnectedState());
  // }

  // handleSocket() {
  //   try {
  //     final wsUrl = Uri.parse(Constant.wsUrl);
  //     _channel = WebSocketChannel.connect(wsUrl);
  //     _channel!.ready
  //         .then((_) {
  //           // Subscribe to ticker data
  //           final subscribeMessage = {
  //             'op': 'subscribe',
  //             'args': TickerModel.requiredCoins.map((symbol) {
  //               return {'channel': 'tickers', 'instId': symbol};
  //             }).toList(),
  //           };

  //           _channel!.sink.add(jsonEncode(subscribeMessage));
  //           print('WebSocket connected and subscribed to tickers');
  //         })
  //         .catchError((error) {
  //           print('WebSocket connection error: $error');
  //           emit(GetCoinsErrorState('Failed to connect to WebSocket'));
  //         });

  //     // Listen to incoming messages
  //     _channel!.stream.listen(
  //       (data) {
  //         try {
  //           final Map<String, dynamic> response = jsonDecode(data);

  //           // Check if response contains ticker data
  //           if (response['data'] != null && response['data'] is List) {
  //             final List<dynamic> tickerData = response['data'];

  //             // Each message typically contains one ticker update
  //             for (var item in tickerData) {
  //               final ticker = TickerModel.fromJson(item);
  //               final coinEntity = ticker.toDomain();

  //               // Update the specific coin in the list
  //               final index = coinsList.indexWhere(
  //                 (coin) => coin.symbol == coinEntity.symbol,
  //               );

  //               if (index != -1) {
  //                 coinsList[index] = coinEntity;
  //                 print('Updated ${coinEntity.symbol}: ${coinEntity.price}');
  //               } else {
  //                 coinsList.add(coinEntity);
  //                 print(
  //                   'Added new coin ${coinEntity.symbol}: ${coinEntity.price}',
  //                 );
  //               }
  //             }

  //             // Emit updated state after processing all items in this message
  //             emit(GetCoinsSuccessState());
  //           } else if (response['event'] != null) {
  //             // Handle subscription confirmation or other events
  //             print('WebSocket event: ${response['event']}');
  //           }
  //         } catch (e) {
  //           print('Error parsing WebSocket message: $e');
  //           print('Raw message: $data');
  //         }
  //       },
  //       onError: (error) {
  //         print('WebSocket stream error: $error');
  //         emit(GetCoinsErrorState('WebSocket connection lost'));
  //       },
  //       onDone: () {
  //         print('WebSocket connection closed');
  //         // Optionally try to reconnect
  //         Future.delayed(const Duration(seconds: 5), () {
  //           handleSocket();
  //         });
  //       },
  //     );
  //   } catch (e) {
  //     print('WebSocket setup error: $e');
  //     emit(GetCoinsErrorState('Failed to setup WebSocket connection'));
  //   }
  // }

  // void closeSocket() {
  //   _channel?.sink.close();
  //   _channel = null;
  // }

  // @override
  // Future<void> close() {
  //   disconnect();
  //   return super.close();
  // }
}
