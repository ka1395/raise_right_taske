import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio.dart';
import '../../domain/entitys/coins_entity.dart';
import '../../domain/repos/dash_board_repo.dart';
import '../data_sources/dash_board_remote_data_source.dart';

class DashBoardRepoImpl extends DashBoardRepo {
  final DashBoardRemoteDataSource dashBoardRemoteDataSource;

  DashBoardRepoImpl({required this.dashBoardRemoteDataSource});

  @override
  Future<Either<Failure, Map<String, CoinsEntity>>> fetchInitialCoins() async {
    if (await DioHelper.networkInfo.isConnected) {
      try {
        Map<String, CoinsEntity> coinsList;
        coinsList = await dashBoardRemoteDataSource.fetchInitialCoins();
        return right(coinsList);
      } catch (error) {
        return left(ErrorHandler.handle((error)).failure);
      }
    } else {
      return left(
        ErrorHandler.handle(
          (DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionError,
          )),
        ).failure,
      );
    }
  }

  @override
  Future<Either<Failure, void>> openWebSocket({
    void Function(CoinsEntity p1)? onCoinsReceived,
  }) async {
    try {
      await dashBoardRemoteDataSource.subscribeToTickerCoinsUpdates(
        onCoinsReceived: onCoinsReceived,
      );
      return right(null);
    } catch (error) {
      return left(ErrorHandler.handle((error)).failure);
    }
  }

  @override
  Future<void> closeWebSocket() async {
    await dashBoardRemoteDataSource.closeWebSocket();
  }
}
