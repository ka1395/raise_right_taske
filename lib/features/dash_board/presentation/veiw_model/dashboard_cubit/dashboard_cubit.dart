import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entitys/coins_entity.dart';
import '../../../domain/use_cases/fetch_initial_data_use_case.dart';
import '../../../domain/use_cases/stream_coins_use_case.dart';
import 'dashboard_state.dart';

enum NetworkState { connecting, connected, disconnected, live }

class DashboardCubit extends Cubit<DashboardState> {
  static DashboardCubit get(context) => BlocProvider.of(context);
  final FetchInitialDataUseCase fetchInitialDataUseCase;
  final StreamCoinsUseCase streamCoinsUseCase;

  NetworkState statusConnection = NetworkState.connecting;

  DashboardCubit(this.fetchInitialDataUseCase, this.streamCoinsUseCase)
    : super(DashboardInitial());

  Map<String, CoinsEntity> coinsList = {};



  // await DioHelper.networkInfo.isConnected
  Future<void> fetchInitialCoins() async {
    emit(GetInitCoinsLoadingState());
    final result = await fetchInitialDataUseCase.call();
    result.fold(
      (failure) {
        emit(GetInitCoinsErrorState(failure.message));
      },

      (coins) async {
        coinsList = coins; // Store the fetched coins in the local list
        statusConnection = NetworkState.connected;
        emit(GetInitCoinsSuccessState());
        // await setupWebSocketListener();
      },
    );
  }

  Future<void> setupWebSocketListener() async {
    emit(WsConnectingState());
    statusConnection = NetworkState.connecting;
    var result = await streamCoinsUseCase.call((coinEntity) {
      coinsList[coinEntity.symbol] = coinEntity;
      emit(WsUpdateState());
    });
    result.fold(
      (failure) {
        statusConnection = NetworkState.connected;
        closeWebSocket();
        emit(WsDisconnectedState());
      },
      (noReturn) {
        statusConnection = NetworkState.live;
        emit(WsConnectedState());
      },
    );
  }

  Future<void> closeWebSocket() async {
    await streamCoinsUseCase.closeWebSocket();
    statusConnection = NetworkState.connected;
    emit(WsDisconnectedState());
  }
}
